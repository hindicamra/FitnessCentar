import 'package:fitness_centar_web/providers/izvjestaj_provider.dart';
import 'package:fitness_centar_web/providers/izvjestaj_recenzija_provider.dart';
import 'package:fitness_centar_web/screen/izvjestaj_screen.dart';
import 'package:fitness_centar_web/screen/korisnici_screen.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:fitness_centar_web/screen/plan_ishrane_screen.dart';
import 'package:fitness_centar_web/screen/recenzije_screen.dart';
import 'package:fitness_centar_web/screen/rezervacija_screen.dart';
import 'package:fitness_centar_web/screen/tip_clanarine_screen.dart';
import 'package:fitness_centar_web/screen/trening_screen.dart';
import 'package:fitness_centar_web/screen/zaposlenici_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'providers/korisnik_provider.dart';
import 'providers/plan_ishrane_provider.dart';
import 'providers/recenzija_provider.dart';
import 'providers/rezervacija_list_provider.dart';
import 'providers/tip_clanarine_provider.dart';
import 'providers/treninzi_list_provider.dart';
import 'providers/uloga_provider.dart';
import 'utils/util.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => KorisnikProvider()),
      ChangeNotifierProvider(create: (_) => UlogaProvider()),
      ChangeNotifierProvider(create: (_) => TreninziListProvider()),
      ChangeNotifierProvider(create: (_) => PlanIshraneProvider()),
      ChangeNotifierProvider(create: (_) => RezervacijaListProvider()),
      ChangeNotifierProvider(create: (_) => RecenzijaProvider()),
      ChangeNotifierProvider(create: (_) => TipClanarineProvider()),
      ChangeNotifierProvider(create: (_) => IzvjestajProvider()),
      ChangeNotifierProvider(create: (_) => IzvjestajRecenzijeProvider()),
    ],
    child: const MyMaterialApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fitnessCentar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAppBar extends StatelessWidget {
  String? title;
  MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!);
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Centar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      onGenerateRoute: (settings) {
        if (settings.name == MenuScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => const MenuScreen()));
        }
        if (settings.name == RecenzijeScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const RecenzijeScreen()),
          );
        }
        if (settings.name == KorisniciScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const KorisniciScreen()));
        }
        if (settings.name == ZaposleniciScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const ZaposleniciScreen()));
        }
        if (settings.name == TreningScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const TreningScreen()));
        }
        if (settings.name == RezervacijaScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const RezervacijaScreen()));
        }
        if (settings.name == TipClanarineScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const TipClanarineScreen()));
        }
        if (settings.name == RezervacijaScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const RezervacijaScreen()));
        }
        if (settings.name == PlanIshraneScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const PlanIshraneScreen()));
        }
        if (settings.name == IzvjestajScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const IzvjestajScreen()));
        }
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  late KorisnikProvider _korisnikProvider;
  int? loggedInUserID;
  @override
  Widget build(BuildContext context) {
    _korisnikProvider = context.read<KorisnikProvider>();
    return Scaffold(
      backgroundColor: const Color(0xfff1f4f8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff4b39ef),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: const Color(0xfff1f4f8),
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text(
                'Fitness Centar',
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Insert username',
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                controller: _usernameController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: 'Insert Password',
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var username = _usernameController.text;
                    var password = _passwordController.text;

                    Authorization.username = username;
                    Authorization.password = password;
                    try {
                      Authorization.korisnik =
                          await _korisnikProvider.authenticate();

                      if (Authorization.korisnik!.ulogaId != 4) {
                        //treba promjeniti 4 u 3
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MenuScreen(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
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
                    } on Exception catch (_) {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text("Upozorenje"),
                                content: const Text(
                                    "Neispravno korisničko ime ili lozinka!"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK"))
                                ],
                              ));
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 46, 92, 232)),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
