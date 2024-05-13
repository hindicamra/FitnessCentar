import 'package:fitness_centar_mobile/models/trening.dart';
import 'package:fitness_centar_mobile/providers/treninzi_list_provider.dart';
import 'package:fitness_centar_mobile/screens/detalji_treninga_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/util.dart';

class TreningListsScreen extends StatefulWidget {
  const TreningListsScreen({Key? key}) : super(key: key);
  static const String routeName = "/trening";

  @override
  State<TreningListsScreen> createState() => _NovostiListScreenState();
}

class _NovostiListScreenState extends State<TreningListsScreen> {
  TreninziListProvider? _treninziProvider;
  List<Trening> data = [];

  @override
  void initState() {
    super.initState();
    _treninziProvider = context.read<TreninziListProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _treninziProvider!.get();
    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista treninzi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buildTreninzi(),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> buildTreninzi() {
    if (data.isEmpty) {
      return [
        const Center(
          child: Text("Nema podataka za prikaz"),
        )
      ];
    }

    List<Widget> list = data
        .map((e) => Column(
              children: [
                InkWell(
                  onTap: () {
                    TreningIdRouteData.id = e.treningId;
                    Navigator.pushNamed(
                      context,
                      DetaljiTreningaScreen.routeName,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.naziv!,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    e.opis!,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )
                                ]),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ))
        .cast<Widget>()
        .toList();
    return list;
  }
}
