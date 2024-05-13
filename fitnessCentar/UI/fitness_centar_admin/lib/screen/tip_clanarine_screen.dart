// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:fitness_centar_web/models/tip_clanarina.dart';
import 'package:fitness_centar_web/providers/tip_clanarine_provider.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:fitness_centar_web/screen/tip_clanarine_dodaj_uredi_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_result.dart';
import '../utils/util.dart';
import 'package:rxdart/rxdart.dart';

final tipClanarineStream = BehaviorSubject<int>.seeded(-1);

class TipClanarineScreen extends StatefulWidget {
  static const String routeName = "/Tip clanarine";
  const TipClanarineScreen({super.key});

  @override
  State<TipClanarineScreen> createState() => _TipClanarineScreenState();
}

class _TipClanarineScreenState extends State<TipClanarineScreen> {
  late TipClanarineProvider _tipClanarineProvider;
  SearchResult<TipClanarina>? result;
  TextEditingController _nazivController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tipClanarineProvider = context.read<TipClanarineProvider>();
    tipClanarineStream.add(-1);
    KorisnikData.tipClanarina = null;
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _tipClanarineProvider.get(filter: {
      'Naziv': null,
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      result = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Tip Clanarine",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: InkWell(
        onTap: () {
          tipClanarineStream.add(-1);
          KorisnikData.tipClanarina = null;
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSearch(),
              const SizedBox(
                height: 40,
              ),
              _buildDataListView(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuScreen(),
                        ),
                      );
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
                      "Nazad na početnu stranicu",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ]),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Unesite naziv"),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: "naziv"),
              controller: _nazivController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _tipClanarineProvider.get(filter: {
                  'naziv': _nazivController.text,
                  'Page': 0,
                  'PageSize': 10,
                });

                setState(() {
                  result = data;
                });
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
                "Pretraži",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TipClanarineDodajUrediScreen(
                    tipClanarina: KorisnikData.tipClanarina,
                  ),
                ),
              );
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
              "Dodaj/Uredi",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataListView() {
    if (result == null) {
      return Container();
    }

    return Expanded(
        child: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: StreamBuilder<Object>(
            stream: tipClanarineStream.stream,
            builder: (context, snapshot) {
              return PaginatedDataTable(
                showCheckboxColumn: false,
                headingRowColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 46, 92, 232)),
                showEmptyRows: false,
                source: _DataSource(data: result!.result),
                columns: [
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Naziv',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Cijena',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Trajanje',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    ));
  }
}

class _DataSource extends DataTableSource {
  final List<TipClanarina> data;

  _DataSource({required this.data});
  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.transparent;
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final e = data[index];

    return DataRow(
        selected: index == tipClanarineStream.value ? true : false,
        onSelectChanged: (value) {
          KorisnikData.tipClanarina = e;
          tipClanarineStream.add(index);
        },
        color: MaterialStateProperty.resolveWith(_getDataRowColor),
        cells: [
          DataCell(Text(e.naziv.toString())),
          DataCell(Text(e.cijena.toString())),
          DataCell(Text(e.trajanje.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
