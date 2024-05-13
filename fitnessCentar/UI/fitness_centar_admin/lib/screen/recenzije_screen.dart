// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:fitness_centar_web/models/recenzija.dart';
import 'package:fitness_centar_web/providers/recenzija_provider.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_result.dart';
import '../utils/util.dart';

class RecenzijeScreen extends StatefulWidget {
  static const String routeName = "/Recenzije";
  const RecenzijeScreen({super.key});

  @override
  State<RecenzijeScreen> createState() => _RecenzijeScreenState();
}

class _RecenzijeScreenState extends State<RecenzijeScreen> {
  late RecenzijaProvider _recenzijaProvider;
  SearchResult<Recenzija>? result;
  TextEditingController _imePrezimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _recenzijaProvider = context.read<RecenzijaProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _recenzijaProvider.get(filter: {
      'ImePrezime': null,
      'UlogaId': 3,
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
          "Recenzije",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: Column(
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
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Unesite Ime/prezime"),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: "ime prezime"),
              controller: _imePrezimeController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _recenzijaProvider.get(filter: {
                  'ImePrezime': _imePrezimeController.text,
                  'UlogaId': 2,
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
      child: Container(
        width: double.infinity,
        child: PaginatedDataTable(
          showCheckboxColumn: false,
          headingRowColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 46, 92, 232)),
          showEmptyRows: false,
          source: _DataSource(data: result!.result),
          columns: [
            const DataColumn(
              label: Expanded(
                child: Text(
                  'Ime Prezime',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const DataColumn(
              label: Expanded(
                child: Text(
                  'Korisničko ime',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const DataColumn(
              label: Expanded(
                child: Text(
                  'Opis',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const DataColumn(
              label: Expanded(
                child: Text(
                  'Ocjena',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _DataSource extends DataTableSource {
  final List<Recenzija> data;

  _DataSource({required this.data});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final e = data[index];

    return DataRow(
        onSelectChanged: (value) {
          KorisnikData.recenzija = e;
        },
        cells: [
          DataCell(
            Text(e.korisnik.toString()),
          ),
          DataCell(
            Text(e.korisnik.toString()),
          ),
          DataCell(Text(e.tekst.toString())),
          DataCell(Text(e.ocjena.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
