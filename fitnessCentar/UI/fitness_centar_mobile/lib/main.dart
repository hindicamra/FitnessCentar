// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:fitness_centar_mobile/providers/clanarina_provider.dart';
import 'package:fitness_centar_mobile/providers/placanja_provider.dart';
import 'package:fitness_centar_mobile/providers/plan_ishrane_provider.dart';
import 'package:fitness_centar_mobile/providers/rezervacija_list_provider.dart';
import 'package:fitness_centar_mobile/providers/treninzi_list_provider.dart';
import 'package:fitness_centar_mobile/screens/clanarina_screen.dart';
import 'package:fitness_centar_mobile/screens/detalji_treninga_screen.dart';
import 'package:fitness_centar_mobile/screens/plan_ishrane.dart';
import 'package:fitness_centar_mobile/screens/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/korisnik_provider.dart';
import 'providers/recenzija_provider.dart';
import 'providers/tip_clanarine_provider.dart';
import 'screens/home_screen.dart';
import 'screens/placanja_screen.dart';
import 'screens/recenzija_dodaj_screen.dart';
import 'screens/registracija_screen.dart';
import 'screens/rezervacija_list_screen.dart';
import 'screens/treninzi_list_screen.dart';
import 'utils/util.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '.env';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TreninziListProvider()),
      ChangeNotifierProvider(create: (_) => KorisnikProvider()),
      ChangeNotifierProvider(create: (_) => PlanIshraneProvider()),
      ChangeNotifierProvider(create: (_) => RezervacijaListProvider()),
      ChangeNotifierProvider(create: (_) => RecenzijaProvider()),
      ChangeNotifierProvider(create: (_) => ClanarinaProvider()),
      ChangeNotifierProvider(create: (_) => PlacanjaProvider()),
      ChangeNotifierProvider(create: (_) => TipClanarineProvider()),
    ],
    child: MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 253, 253)),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      onGenerateRoute: (settings) {
        if (settings.name == PlacanjaScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => PlacanjaScreen()));
        }
        if (settings.name == MyApp.routeName) {
          return MaterialPageRoute(builder: ((context) => MyApp()));
        }
        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => HomeScreen()));
        }
        if (settings.name == RegistracijaScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => RegistracijaScreen()));
        }
        if (settings.name == TreningListsScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => TreningListsScreen()));
        }
        if (settings.name == PlanIshraneScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => PlanIshraneScreen()));
        }
        if (settings.name == RezervacijaListScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => RezervacijaListScreen()));
        }

        if (settings.name == RecenzijaDodajScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => RecenzijaDodajScreen()));
        }
        if (settings.name == ClanarinaListScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => ClanarinaListScreen()));
        }
        if (settings.name == DetaljiTreningaScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => DetaljiTreningaScreen()));
        }
        if (settings.name == ProfilScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => ProfilScreen()));
        }
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  static const String routeName = "/myApp";
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late KorisnikProvider _korisnikProvider;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _korisnikProvider = Provider.of<KorisnikProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(50), // Image radius
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Fitness App',
              style: TextStyle(
                color: Color.fromARGB(255, 11, 9, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Dobro dosli'),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Korisničko ime je obavezno!";
                              } else if (value.length < 3) {
                                return "Korisničko ime ne može imati manje od 3 slova";
                              }
                              return null;
                            },
                            controller: _username,
                            decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding:
                                  const EdgeInsets.only(left: 14.0, top: 0.0),
                              border: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Lozinka ne moze biti prazno polje";
                              } else if (value.length < 4) {
                                return "Lozinka ne može imati manje od 4 slova";
                              }
                              return null;
                            },
                            controller: _password,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding:
                                  const EdgeInsets.only(left: 14.0, top: 0.0),
                              border: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Authorization.korisnik = null;
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        Authorization.username = _username.text;
                                        Authorization.password = _password.text;

                                        Authorization.korisnik =
                                            await _korisnikProvider
                                                .authenticate();

                                        if (Authorization.korisnik!.ulogaId !=
                                            4) {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  HomeScreen.routeName,
                                                  (route) => false);
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text('Upozorenje'),
                                              content: const Text(
                                                  "Neispravno korisničko ime ili lozinka!"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('OK'),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Text("Upozorenje"),
                                                  content: Text(
                                                      "Neispravno korisničko ime ili lozinka!"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("Ok"),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                    )
                                                  ],
                                                ));
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 46, 92, 232)),
                                  ),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            RegistracijaScreen.routeName,
                                            (route) => false);
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 204, 204, 204)),
                                  ),
                                  child: const Text(
                                    "Registracija",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }
}
