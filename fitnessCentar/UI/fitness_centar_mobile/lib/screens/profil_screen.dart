// ignore_for_file: use_build_context_synchronously

import 'package:fitness_centar_mobile/models/clanarina.dart';
import 'package:fitness_centar_mobile/providers/clanarina_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/korisnik.dart';
import 'package:intl/intl.dart';
import '../models/placanja.dart';
import '../providers/korisnik_provider.dart';
import '../utils/util.dart';
import 'profil_aktiviraj_clanarinu.dart';

class ProfilScreen extends StatefulWidget {
  static const String routeName = "/profil_screen";
  ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  ClanarinaProvider? _clanarinaProvider;
  List<Clanarina> data = [];

  Map<String, dynamic>? paymentIntentData;
  Placanja? placanja;

  @override
  void initState() {
    super.initState();
    _clanarinaProvider = context.read<ClanarinaProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _clanarinaProvider!.get(search: {
      'korisnikId': Authorization.korisnik!.korisnikId,
      'Page': 0,
      'PageSize': 10,
    });

    setState(() {
      data = tmpData;
    });
  }

  late KorisnikProvider _korisnikProvider;

  final TextEditingController _imeController =
      TextEditingController(text: Authorization.username);
  final TextEditingController _prezimeController =
      TextEditingController(text: Authorization.korisnik?.prezime!);
  final TextEditingController _korisnickoIme =
      TextEditingController(text: Authorization.korisnik?.korisnickoIme!);
  final TextEditingController _emailController =
      TextEditingController(text: Authorization.korisnik?.email!);
  final TextEditingController _telefonController =
      TextEditingController(text: Authorization.korisnik?.telefon);
  final TextEditingController _adresaController =
      TextEditingController(text: Authorization.korisnik?.addresa!);
  final TextEditingController _passwordController =
      TextEditingController(text: Authorization.password!);
  final TextEditingController _potvrdaPasswordaController =
      TextEditingController(text: Authorization.password!);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _korisnikProvider = Provider.of<KorisnikProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Profil",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 23, 121, 251),
        ),
        backgroundColor: const Color(0xfff1f4f8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  Column(
                    children: _buildClanarinaByUser(),
                  ),
                  buildProfile(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Map korisnik = {
                                  "ime": _imeController.text,
                                  "prezime": _prezimeController.text,
                                  "korisnickoIme": _korisnickoIme.text,
                                  "email": _emailController.text,
                                  "telefon": _telefonController.text,
                                  "password": _passwordController.text,
                                  "passwordPotvrda":
                                      _potvrdaPasswordaController.text,
                                  "ulogaId": 0,
                                  "addresa": _adresaController.text,
                                  "status": true
                                };

                                Authorization.korisnik =
                                    await _korisnikProvider.updateKorisnika(
                                        korisnik,
                                        Authorization.korisnik!.korisnikId!);
                                Authorization.username = _imeController.text;
                                Authorization.password =
                                    _passwordController.text;

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Profil uspješno uređen"),
                                  backgroundColor:
                                      Color.fromARGB(255, 46, 92, 232),
                                ));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 46, 92, 232)),
                            ),
                            child: const Text("Update",
                                style: TextStyle(color: Colors.white))),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }

  Widget buildProfile() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text('Ime:', style: Theme.of(context).textTheme.titleLarge),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Ime ne smije ostati prazno polje";
                } else if (value.length < 3) {
                  return "Ime ne smije sadrzavati manje od 3 slova";
                }
                return null;
              },
              controller: _imeController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child:
                Text('Prezime:', style: Theme.of(context).textTheme.titleLarge),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Prezime ne smije ostati prazno polje";
                } else if (value.length < 3) {
                  return "Prezime ne smije sadrzavati manje od 3 slova";
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              controller: _prezimeController,
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                Text('Korisnicko ime:',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Korisničko ime ne smije ostati prazno polje";
                } else if (value.length < 3) {
                  return "Korisničko ime ne smije sadrzavati manje od 3 slova";
                }
                return null;
              },
              controller: _korisnickoIme,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                Row(
                  children: [
                    Text('Email:',
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ],
            ),
          ),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email ne smije ostati prazno polje";
                }
                return null;
              },
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child:
                Text('Telefon:', style: Theme.of(context).textTheme.titleLarge),
          ),
          TextFormField(
              controller: _telefonController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Text(
              'Adresa:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          TextFormField(
              controller: _adresaController,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                Text('Password:',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                Text('Potvrda passworda:',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14.0, top: 0.0),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              controller: _potvrdaPasswordaController,
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  List<Widget> _buildClanarinaByUser() {
    if (data.isEmpty) {
      return [
        const Center(
          child: Text("Nema podataka za prikaz"),
        )
      ];
    }

    List<Widget> list = data
        .map((e) {
          var formatDateTime =
              DateFormat('dd-MM-yyyy').format(DateTime.parse(e.vaziDo!));

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Tip članarine: '),
                          const SizedBox(
                            width: 20,
                          ),
                          clanarina(e.tipClanarine!)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Važi do: '),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(formatDateTime),
                        ],
                      ),
                    ]),
              ),
              ProfilAktivirajClanarinu(
                tipClanarinaId: e.tipClanarineId!,
              )
            ],
          );
        })
        .cast<Widget>()
        .toList();

    return list;
  }

  Widget clanarina(String tipClanarine) {
    if (data.isNotEmpty) {
      if (tipClanarine == '7-dnevna') {
        return const Text(
          "Sedmična",
          style: TextStyle(),
        );
      } else if (tipClanarine == '30-dnevna') {
        return const Text(
          "Mjesečna",
          style: TextStyle(),
        );
      } else if (tipClanarine == '60-dnevna') {
        return const Text(
          "Dva mjeseca",
          style: TextStyle(),
        );
      } else if (tipClanarine == '180-dnevna') {
        return const Text(
          "Polugodišnja",
          style: TextStyle(),
        );
      } else {
        return const Text(
          "Godišnja",
          style: TextStyle(),
        );
      }
    }
    return Container();
  }
}
