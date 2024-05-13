// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/models/plan_ishrane.dart';
import 'package:fitness_centar_web/providers/plan_ishrane_provider.dart';
import 'package:fitness_centar_web/screen/plan_ishrane_screen.dart';
import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../models/uloga.dart';
import '../providers/uloga_provider.dart';

class PlanIshraneDodajUrediScreen extends StatefulWidget {
  PlanIshrane? planIshrane;
  PlanIshraneDodajUrediScreen({Key? key, this.planIshrane}) : super(key: key);

  @override
  State<PlanIshraneDodajUrediScreen> createState() =>
      _PlanIshraneDodajUrediScreenState();
}

class _PlanIshraneDodajUrediScreenState
    extends State<PlanIshraneDodajUrediScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};

  late PlanIshraneProvider _planIshraneProvider;
  late UlogaProvider _ulogaProvider;

  SearchResult<Uloga>? ulogaResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'naziv': widget.planIshrane?.naziv,
      // 'korisnik': widget.planIshrane?.korisnik,
      'opis': widget.planIshrane?.opis,
    };
    _planIshraneProvider = context.read<PlanIshraneProvider>();
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
                                // double? cijena =
                                //     double.tryParse(request['cijena'] ?? '');
                                // int? trajanje =
                                //     int.tryParse(request['trajanje'] ?? '');

                                if (!_validateNaziv(request['naziv'])) {
                                  _showNazivWarning();
                                  return;
                                }
                                // if (!_validateOpis(request['opis'])) {
                                //   _showOpisWarning();
                                //   return;
                                // }

                                Map planIshrane = {
                                  "naziv": request['naziv'],
                                  // "opis": request['opis'],
                                };
                                try {
                                  PlanIshrane updatetipClanarine;
                                  if (widget.planIshrane != null) {
                                    updatetipClanarine =
                                        (await _planIshraneProvider
                                            .updatePlanIshrane(
                                                planIshrane,
                                                widget.planIshrane!
                                                    .planIshraneId!));
                                  } else {
                                    updatetipClanarine =
                                        (await _planIshraneProvider
                                            .insert(planIshrane))!;
                                  }
                                  KorisnikData.planIshrane = null;
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
                                      const PlanIshraneScreen(),
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
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormBuilderTextField(
                //         decoration: InputDecoration(
                //             labelText: "Opis", hintText: "Opis"),
                //         name: "opis",
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }

  bool _validateNaziv(String? ime) {
    return ime != null && ime.isNotEmpty && ime.length >= 2;
  }

  bool _validateOpis(String? value) {
    return value != null && value.isNotEmpty && value.length >= 2;
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

  void _showOpisWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Opis je obavezno i mora imati minimalno 2 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
  //  void _showPlanoviIshraneWarning() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: Text("Upozorenje"),
  //       content: Text(
  //           "Planovi ishrane je obavezno i mora imati minimalno 4 karaktera!"),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text("OK"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
