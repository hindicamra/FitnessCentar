// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/screen/plan_ishrane_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/plan_ishrane.dart';
import '../models/search_result.dart';
import '../providers/plan_ishrane_provider.dart';

class PlanIshraneDodajScreen extends StatefulWidget {
  PlanIshraneDodajScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PlanIshraneDodajScreen> createState() => _PlanIshraneDodajState();
}

class _PlanIshraneDodajState extends State<PlanIshraneDodajScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  late PlanIshraneProvider _planIshraneProvider;

  SearchResult<PlanIshrane>? planIshraneResult;

  @override
  void initState() {
    super.initState();

    _planIshraneProvider = context.read<PlanIshraneProvider>();
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
                    _buildForm(),
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
                                  await _planIshraneProvider.insert(trening);

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
