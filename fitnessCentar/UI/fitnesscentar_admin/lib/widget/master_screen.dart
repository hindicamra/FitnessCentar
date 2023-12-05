import 'package:fitnesscentar_admin/screens/korisnici_screen.dart';
import 'package:fitnesscentar_admin/screens/uposlenici_screen.dart';
import 'package:flutter/material.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  MasterScreenWidget({this.child, super.key});

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidget();
}

class _MasterScreenWidget extends State<MasterScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Korisnici"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const KorisniciScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Korisnici"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const UposleniciScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: widget.child!,
    );
  }
}