import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/placanja.dart';
import '../models/tip_clanarina.dart';
import '../providers/clanarina_provider.dart';
import '../providers/placanja_provider.dart';
import '../providers/tip_clanarine_provider.dart';
import '../utils/util.dart';
import 'home_screen.dart';

class ProfilAktivirajClanarinu extends StatefulWidget {
  final int tipClanarinaId;
  const ProfilAktivirajClanarinu({required this.tipClanarinaId, super.key});

  @override
  State<ProfilAktivirajClanarinu> createState() =>
      _ProfilAktivirajClanarinuState();
}

class _ProfilAktivirajClanarinuState extends State<ProfilAktivirajClanarinu> {
  TipClanarineProvider? _tipClanarineProvider;
  TipClanarina? data;
  PlacanjaProvider? _placanjaProvider;
  Map<String, dynamic>? paymentIntentData;
  Placanja? placanja;
  ClanarinaProvider? _clanarinaProvider;

  @override
  void initState() {
    super.initState();

    _tipClanarineProvider = context.read<TipClanarineProvider>();
    _placanjaProvider = context.read<PlacanjaProvider>();
    _clanarinaProvider = context.read<ClanarinaProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _tipClanarineProvider!.getById(widget.tipClanarinaId);

    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Map clanarina = {
            "iznos": data!.cijena!,
            "tipClanarineId": data!.tipClanarineId,
            "korisnikId": Authorization.korisnik!.korisnikId!,
            "datum": DateTime.now()
                .add(Duration(days: data!.trajanje!))
                .toIso8601String()
          };

          await _placanjaProvider!.placanjeClanarine(clanarina);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Aktivirano/produzeno"),
            backgroundColor: Color.fromARGB(255, 46, 92, 232),
          ));
          BottomNavigationBar navigationBar =
              glbKey.currentWidget as BottomNavigationBar;
          navigationBar.onTap!(2);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 46, 92, 232)),
        ),
        child: const Text("Aktiviraj/produži",
            style: TextStyle(color: Colors.white)));
  }
}
