// ignore_for_file: use_build_context_synchronously

import 'package:fitness_centar_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/korisnik.dart';

import '../providers/korisnik_provider.dart';
import '../utils/util.dart';

class RegistracijaScreen extends StatefulWidget {
  static const String routeName = "/registracija_screen";
  RegistracijaScreen({Key? key}) : super(key: key);

  @override
  State<RegistracijaScreen> createState() => _RegistracijaScreenState();
}

class _RegistracijaScreenState extends State<RegistracijaScreen> {
  late KorisnikProvider _korisnikProvider;

  final TextEditingController _imeController = TextEditingController();
  final TextEditingController _prezimeController = TextEditingController();
  final TextEditingController _korisnickoIme = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _adresaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _potvrdaPasswordaController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _korisnikProvider = Provider.of<KorisnikProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Registracija",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 23, 121, 251),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
        ),
        backgroundColor: const Color(0xfff1f4f8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.white,
                child: Column(children: [
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
                                  "ulogaId": 3,
                                  "addresa": _adresaController.text,
                                  "status": true
                                };

                                await _korisnikProvider.registar(korisnik);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Uspješno ste se registrovali"),
                                  backgroundColor:
                                      Color.fromARGB(255, 46, 92, 232),
                                ));
                                Navigator.pop(context);
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
                            child: const Text("Registruj se",
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
                hintText: 'Ime',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
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
                hintText: 'Prezime',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
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
                hintText: 'Korisnicko ime',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email ne smije ostati prazno polje";
                }
                return null;
              },
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          TextFormField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 8 ||
                    value.length > 11) {
                  return "Broj telefona je obavezan, mora imati minimalno 8 karaktera";
                }
                return null;
              },
              controller: _telefonController,
              decoration: InputDecoration(
                hintText: 'Telefon',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          TextFormField(
              controller: _adresaController,
              decoration: InputDecoration(
                hintText: 'Adresa',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          TextFormField(
              validator: (value) {
                if (!_validateLozinkuRegExp(value)) {
                  return "Lozinka je obavezna, treba sadrzavati minimalno 4 karaktera,  veliko i malo slovo, broj i specijalan karakter ";
                }
                return null;
              },
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 16),
          TextFormField(
              validator: (value) {
                if (!_validatePasswordAndConfirmPassword(
                    value, _passwordController.text)) {
                  return "Lozinka i potvrda lozinke se ne podudaraju. Molimo unesite iste vrijednosti u oba polja.";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Potvrda passworda',
                hintStyle: const TextStyle(fontSize: 14),
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
              style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  bool _validateLozinkuRegExp(String? lozinka) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$');
    return regex.hasMatch(lozinka!);
  }

  bool _validatePasswordAndConfirmPassword(
      String? lozinka, String? potvrdaLozinke) {
    return lozinka == potvrdaLozinke;
  }
}
