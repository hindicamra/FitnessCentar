import 'package:fitness_centar_mobile/models/trening.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/treninzi_list_provider.dart';

class RezervacijaTreningById extends StatefulWidget {
  final int id;
  const RezervacijaTreningById({required this.id, super.key});

  @override
  State<RezervacijaTreningById> createState() => _RezervacijaTreningByIdState();
}

class _RezervacijaTreningByIdState extends State<RezervacijaTreningById> {
  TreninziListProvider? _treningListProvider;
  Trening? data;

  @override
  void initState() {
    super.initState();
    _treningListProvider = context.read<TreninziListProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _treningListProvider!.getById(widget.id);
    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        if (data != null)
          Container(
            alignment: Alignment.center,
            child: Text(
              data!.naziv!,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        if (data != null)
          Text(
            data!.opis!,
          ),
      ])
    ]);
  }
}
