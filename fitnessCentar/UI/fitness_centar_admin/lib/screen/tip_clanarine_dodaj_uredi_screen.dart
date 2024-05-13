// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/models/tip_clanarina.dart';
import 'package:fitness_centar_web/providers/tip_clanarine_provider.dart';
import 'package:fitness_centar_web/screen/tip_clanarine_screen.dart';
import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../models/uloga.dart';
import '../providers/uloga_provider.dart';

class TipClanarineDodajUrediScreen extends StatefulWidget {
  TipClanarina? tipClanarina;
  TipClanarineDodajUrediScreen({Key? key, this.tipClanarina}) : super(key: key);

  @override
  State<TipClanarineDodajUrediScreen> createState() =>
      _TipClanarineDodajUrediScreenState();
}

class _TipClanarineDodajUrediScreenState
    extends State<TipClanarineDodajUrediScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};

  late TipClanarineProvider _tipClanarinaProvider;
  late UlogaProvider _ulogaProvider;

  SearchResult<Uloga>? ulogaResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'naziv': widget.tipClanarina?.naziv,
      'cijena': widget.tipClanarina?.cijena.toString(),
      'trajanje': widget.tipClanarina?.trajanje.toString(),
    };
    _tipClanarinaProvider = context.read<TipClanarineProvider>();
    _ulogaProvider = context.read<UlogaProvider>();

    initForm();
  }

  Future initForm() async {
    ulogaResult = await _ulogaProvider.get();
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
                                double? cijena =
                                    double.tryParse(request['cijena'] ?? '');
                                int? trajanje =
                                    int.tryParse(request['trajanje'] ?? '');

                                if (!_validateNaziv(request['naziv'])) {
                                  _showNazivWarning();
                                  return;
                                }
                                if (!_validateCijena(cijena)) {
                                  _showCijenaWarning();
                                  return;
                                }
                                if (!_validateTrajanje(trajanje)) {
                                  _showTrajanjeWarning();
                                  return;
                                }
                                Map tipClanarine = {
                                  "naziv": request['naziv'],
                                  "cijena": request['cijena'],
                                  "trajanje": request['trajanje'],
                                };
                                try {
                                  if (widget.tipClanarina != null) {
                                    await _tipClanarinaProvider
                                        .updateTipClanarine(
                                            tipClanarine,
                                            widget
                                                .tipClanarina!.tipClanarineId!);
                                  } else {
                                    await _tipClanarinaProvider
                                        .insert(tipClanarine);
                                  }
                                  KorisnikData.tipClanarina = null;
                                  _formKey.currentState!.reset();
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
                                  builder: (context) =>
                                      const TipClanarineScreen(),
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
                            labelText: "Cijena", hintText: "Unesite cijenu"),
                        name: "cijena",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Trajanje",
                            hintText: "Unesite trajanje"),
                        name: "trajanje",
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

  bool _validateNaziv(String? ime) {
    return ime != null && ime.isNotEmpty && ime.length >= 2;
  }

  bool _validateCijena(double? cijena) {
    return cijena != null && cijena >= 1.0;
  }

  bool _validateTrajanje(int? trajanje) {
    return trajanje != null && trajanje >= 1;
  }

  void _showNazivWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Naziv je obavezno i mora imati minimalno 2 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showCijenaWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text(
            "Cijena je obavezno i mora imati cijenu vecu ili jednaku od 1.0"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showTrajanjeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text(
            "Trajanje je obavezno i mora imati cijenu vecu ili jednaku od 1"),
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
