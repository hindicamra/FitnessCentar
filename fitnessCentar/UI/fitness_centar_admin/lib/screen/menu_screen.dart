import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  static const String routeName = "/menu";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List menuItems;
  @override
  void initState() {
    super.initState();

    menuItems = [
      if (Authorization.korisnik!.ulogaId != 2) 'Zaposlenici',
      'Korisnici',
      'Trening',
      if (Authorization.korisnik!.ulogaId != 1) 'Rezervacija',
      'Tip clanarine',
      if (Authorization.korisnik!.ulogaId != 1) 'Plan ishrane',
      if (Authorization.korisnik!.ulogaId != 2) 'Izvjestaj',
      'Recenzije',
      'Odjava'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Menu",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 600,
                  width: 600,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: _buildMenuGridView(),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildMenuGridView() {
    Widget list = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (menuItems[index] != 'Odjava') {
                Navigator.pushReplacementNamed(
                  context,
                  "/${menuItems[index]}",
                );
              } else {
                Authorization.password = null;

                Authorization.korisnik = null;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              }
            },
            child: Card(
              color: Colors.white,
              child: Center(child: Text('${menuItems[index]}')),
            ),
          );
        });

    return list;
  }
}
