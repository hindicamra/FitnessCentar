import 'package:fitness_centar_mobile/models/tip_clanarina.dart';
import 'package:fitness_centar_mobile/providers/tip_clanarine_provider.dart';
import 'package:fitness_centar_mobile/screens/placanja_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/util.dart';

class ClanarinaListScreen extends StatefulWidget {
  const ClanarinaListScreen({Key? key}) : super(key: key);
  static const String routeName = "/clanarina";

  @override
  State<ClanarinaListScreen> createState() => _ClanarinaListScreenState();
}

class _ClanarinaListScreenState extends State<ClanarinaListScreen> {
  TipClanarineProvider? _clanarinaProvider;
  List<TipClanarina> data = [];

  @override
  void initState() {
    super.initState();
    _clanarinaProvider = context.read<TipClanarineProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _clanarinaProvider!.get();
    setState(() {
      data = tmpData;
    });
  }

  Widget clanarina(int tipClanarine) {
    if (data.isNotEmpty) {
      if (tipClanarine == 7) {
        return const Text(
          "Sedmična",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else if (tipClanarine == 30) {
        return const Text(
          "Mjesečna",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else if (tipClanarine == 180) {
        return const Text(
          "Polugodišnja",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else {
        return const Text(
          "Godišnja",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: const Text(
          "Izbor Clanarine",
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
                children: _buildListTipClanarine(),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<Widget> _buildListTipClanarine() {
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
                    TipClanarineId.id = e.tipClanarineId;
                    Navigator.pushNamed(
                      context,
                      PlacanjaScreen.routeName,
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(child: clanarina(e.trajanje!)),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Trajanje: ",
                                  ),
                                  Text(
                                    e.trajanje.toString(),
                                  )
                                ]),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Cijena: ",
                                  ),
                                  Text(
                                    e.cijena!.toString(),
                                  )
                                ])
                          ]),
                    ),
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
