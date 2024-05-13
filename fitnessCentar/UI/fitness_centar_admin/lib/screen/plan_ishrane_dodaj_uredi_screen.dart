// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/models/plan_ishrane.dart';
import 'package:fitness_centar_web/models/plan_ishrane_korisnika.dart';
import 'package:fitness_centar_web/providers/plan_ishrane_provider.dart';
import 'package:fitness_centar_web/screen/plan_ishrane_screen.dart';
import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../models/uloga.dart';
import '../providers/plan_ishrane_korisnika_provider.dart';
import '../providers/uloga_provider.dart';
import 'plan_ishrane_dodaj_screen.dart';

class PlanIshraneDodajUrediScreen extends StatefulWidget {
  PlanIshraneKorisnika? planIshrane;
  PlanIshraneDodajUrediScreen({Key? key, this.planIshrane}) : super(key: key);

  @override
  State<PlanIshraneDodajUrediScreen> createState() =>
      _PlanIshraneDodajUrediScreenState();
}

class _PlanIshraneDodajUrediScreenState
    extends State<PlanIshraneDodajUrediScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};
  late PlanIshraneKorisnikaProvider _planIshraneKorisnikaProvider;
  late PlanIshraneProvider _planIshraneProvider;
  late UlogaProvider _ulogaProvider;

  SearchResult<Uloga>? ulogaResult;
  SearchResult<PlanIshrane>? planIshraneResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'imePrezime': widget.planIshrane?.korisnik,
      'opis': widget.planIshrane?.planIshrane,
    };
    _planIshraneProvider = context.read<PlanIshraneProvider>();
    _ulogaProvider = context.read<UlogaProvider>();
    _planIshraneKorisnikaProvider =
        context.read<PlanIshraneKorisnikaProvider>();

    initForm();
  }

  Future initForm() async {
    ulogaResult = await _ulogaProvider.get();
    planIshraneResult = await _planIshraneProvider.get();
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

                                if (widget.planIshrane != null) {
                                  Map planIshrane = {
                                    "planIshraneId": int.tryParse(_formKey
                                        .currentState?.value['planIshrane']),
                                    "korisnikId": widget
                                        .planIshrane!.planIshraneKorisnikId
                                    // Authorization.korisnik!.korisnikId,
                                  };
                                  try {
                                    await _planIshraneKorisnikaProvider
                                        .insert(planIshrane);

                                    KorisnikData.planIshraneKorisnika = null;
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
                                }
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
                    Text('Ime Prezime'),
                    SizedBox(
                      width: 40,
                    ),
                    if (widget.planIshrane != null)
                      Text(widget.planIshrane!.korisnik.toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Izaberite plan ishrane",
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                        child: FormBuilderDropdown<String>(
                      name: 'planIshrane',
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 3.0,
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Please Select',
                          hintStyle: TextStyle(fontSize: 16)),
                      items: planIshraneResult?.result
                              .map((item) => DropdownMenuItem(
                                    alignment: AlignmentDirectional.topStart,
                                    value: item.planIshraneId.toString(),
                                    child: Text(item.naziv ?? ""),
                                  ))
                              .toList() ??
                          [],
                    )),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlanIshraneDodajScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 46, 92, 232)),
                        ),
                        child: Text(
                          "Dodaj plan ishrane",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }
}
