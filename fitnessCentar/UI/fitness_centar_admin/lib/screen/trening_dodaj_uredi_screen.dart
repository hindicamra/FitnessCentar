// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/models/trening.dart';
import 'package:fitness_centar_web/providers/treninzi_list_provider.dart';
import 'package:fitness_centar_web/screen/trening_screen.dart';
import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../providers/uloga_provider.dart';

class TreningDodajUrediScreen extends StatefulWidget {
  Trening? trening;
  TreningDodajUrediScreen({Key? key, this.trening}) : super(key: key);

  @override
  State<TreningDodajUrediScreen> createState() =>
      _TreningDodajUrediScreenState();
}

class _TreningDodajUrediScreenState extends State<TreningDodajUrediScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};

  late TreninziListProvider _treninziListProvider;
  late UlogaProvider _ulogaProvider;

  SearchResult<Trening>? ulogaResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'naziv': widget.trening?.naziv,
      'opis': widget.trening?.opis,
    };
    _treninziListProvider = context.read<TreninziListProvider>();

    initForm();
  }

  Future initForm() async {
    ulogaResult = await _treninziListProvider.get();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f4f8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Dodaj/Uredi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 800,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isLoading ? Container() : _buildForm(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                _formKey.currentState?.saveAndValidate();

                                var request =
                                    Map.from(_formKey.currentState!.value);

                                if (!_validateIme(request['naziv'])) {
                                  _showImeWarning();
                                  return;
                                }
                                if (!_validatePrezime(request['opis'])) {
                                  _showPrezimeWarning();
                                  return;
                                }

                                Map trening = {
                                  "naziv": request['naziv'],
                                  "opis": request['opis'],
                                };
                                try {
                                  if (widget.trening != null) {
                                    await _treninziListProvider.updateTreninga(
                                        trening, widget.trening!.treningId!);
                                  } else {
                                    await _treninziListProvider.insert(trening);
                                  }
                                  KorisnikData.trening = null;
                                  _formKey.currentState!.reset();
                                  // Navigator.pop(context, updatedEmployee);
                                } on Exception catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text("Error"),
                                            content: Text(e.toString()),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text("OK"))
                                            ],
                                          ));
                                }
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const TreningScreen(),
                                ));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 46, 92, 232)),
                              ),
                              child: Text(
                                "Sačuvaj",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 46, 92, 232)),
                              ),
                              child: Text(
                                "Nazad",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Naziv", hintText: "Unesite naziv"),
                        name: "naziv",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Opis", hintText: "Unesite opis"),
                        name: "opis",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }

  bool _validateIme(String? ime) {
    return ime != null && ime.isNotEmpty && ime.length >= 2;
  }

  bool _validatePrezime(String? prezime) {
    return prezime != null && prezime.isNotEmpty && prezime.length >= 2;
  }

  void _showImeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Naziv je obavezan i mora imati minimalno 4 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showPrezimeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Opis je obavezan i mora imati minimalno 2 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
