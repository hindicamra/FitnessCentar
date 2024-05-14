import 'package:fitness_centar_mobile/models/plan_ishrane.dart';
import 'package:fitness_centar_mobile/providers/korisnik_provider.dart';
import 'package:fitness_centar_mobile/providers/plan_ishrane_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../utils/util.dart';
import 'home_screen.dart';

class PlanIshraneScreen extends StatefulWidget {
  const PlanIshraneScreen({Key? key}) : super(key: key);
  static const String routeName = "/planIshrane";
  @override
  State<PlanIshraneScreen> createState() => _GalerijaListScreenState();
}

class _GalerijaListScreenState extends State<PlanIshraneScreen> {
  KorisnikProvider? _galerijaProvider;
  List<PlanIshrane> data = [];

  @override
  void initState() {
    super.initState();
    _galerijaProvider = context.read<KorisnikProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _galerijaProvider!.get(filter: {
      'ImePrezime': Authorization.korisnik!.korisnickoIme,
      'UlogaId': null,
      'Page': 0,
      'PageSize': 100,
    });
    setState(() {
      data = tmpData.result[0].planoviIshrane!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: const Text(
          "Plan Ishrane",
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
            children: data.isEmpty
                ? [const Center(child: Text('Nema plana ishrane'))]
                : _buildGallery(),
          ),
        )),
      ),
    );
  }

  List<Widget> _buildGallery() {
    var list = data
        .map((e) => Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              e.naziv!,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.opis!,
                                  )
                                ]),
                          )
                        ]),
                  ),
                ),
              )
            ]))
        .cast<Widget>()
        .toList();

    return list;
  }
}
