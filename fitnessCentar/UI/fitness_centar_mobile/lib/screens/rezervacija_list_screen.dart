import 'package:fitness_centar_mobile/models/clanarina.dart';
import 'package:fitness_centar_mobile/models/rezervacija.dart';
import 'package:fitness_centar_mobile/providers/clanarina_provider.dart';

import 'package:fitness_centar_mobile/providers/rezervacija_list_provider.dart';
import 'package:fitness_centar_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'recenzija_dodaj_screen.dart';
import 'rezervacija_trening_by_Id.dart';

class RezervacijaListScreen extends StatefulWidget {
  const RezervacijaListScreen({super.key});
  static const String routeName = "/rezervacijaList";
  @override
  State<RezervacijaListScreen> createState() => _RezervacijaListScreenState();
}

class _RezervacijaListScreenState extends State<RezervacijaListScreen> {
  RezervacijaListProvider? _rezervacijaProvider;

  List<Rezervacija> rezervacija = [];
  ClanarinaProvider? _clanarinaProvider;

  List<Clanarina> clanarina = [];
  @override
  void initState() {
    super.initState();
    _rezervacijaProvider = context.read<RezervacijaListProvider>();
    _clanarinaProvider = context.read<ClanarinaProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _rezervacijaProvider!.get(filter: {
      'KorisnikId': Authorization.korisnik!.korisnikId,
      'Datum': null,
      'Status': null,
      'Page': 0,
      'PageSize': 100,
    });
    var dataClanarina = await _clanarinaProvider!.get(filter: {
      'KorisnikId': Authorization.korisnik!.korisnikId,
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      rezervacija = data.result;
      clanarina = dataClanarina.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: const Text(
          "Lista rezervacija",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: Container(
        color: Colors.grey[100]!,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: rezervacija.isEmpty
                ? [const Center(child: Text('Nema rezervacija'))]
                : _buildListRezervacija(),
          ),
        )),
      ),
    );
  }

  List<Widget> _buildListRezervacija() {
    var list = rezervacija
        .map((e) => Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RecenzijaDodajScreen.routeName,
                        arguments: e.treningId);
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RezervacijaTreningById(
                              id: e.treningId ?? 0,
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Datum: ",
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.parse(e.datum!)),
                                  )
                                ]),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Status: ",
                                  ),
                                  Text(
                                    e.status!,
                                  )
                                ])
                          ]),
                    ),
                  ),
                ),
              )
            ]))
        .cast<Widget>()
        .toList();

    return list;
  }
}
