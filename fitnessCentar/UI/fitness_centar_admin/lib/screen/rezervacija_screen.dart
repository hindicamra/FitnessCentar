import 'package:fitness_centar_web/models/rezervacija.dart';
import 'package:fitness_centar_web/providers/rezervacija_list_provider.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/util.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

final rezervacijaStream = BehaviorSubject<int>.seeded(-1);

class RezervacijaScreen extends StatefulWidget {
  static const String routeName = "/Rezervacija";
  const RezervacijaScreen({super.key});

  @override
  State<RezervacijaScreen> createState() => _RezervacijaScreenState();
}

class _RezervacijaScreenState extends State<RezervacijaScreen> {
  late RezervacijaListProvider _rezervacijaListProvider;
  List<Rezervacija>? result;
  final TextEditingController _datumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _rezervacijaListProvider = context.read<RezervacijaListProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _rezervacijaListProvider.get(filter: {
      'Datum': null,
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      result = data.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Rezervacija",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: StreamBuilder<Object>(
          stream: rezervacijaStream.stream,
          builder: (context, snapshot) {
            return Column(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                ]);
          }),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Unesite datum"),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: "datum"),
              controller: _datumController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _rezervacijaListProvider.get(filter: {
                  'Datum': _datumController.text,
                  'Page': 0,
                  'PageSize': 100,
                });

                setState(() {
                  result = data.result;
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
                await _rezervacijaListProvider.updateRezervacija({
                  "status": 1,
                }, KorisnikData.rezervacijaStatus!.rezervacijaId!);

                var data = await _rezervacijaListProvider.get(filter: {
                  'Datum': _datumController.text,
                  'Page': 0,
                  'PageSize': 100,
                });

                setState(() {
                  result = data.result;
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
                "Prihvati",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(width: 8),
          ElevatedButton(
              onPressed: () async {
                await _rezervacijaListProvider.updateRezervacija({
                  "status": 2,
                }, KorisnikData.rezervacijaStatus!.rezervacijaId!);

                var data = await _rezervacijaListProvider.get(filter: {
                  'Datum': _datumController.text,
                  'Page': 0,
                  'PageSize': 100,
                });

                setState(() {
                  result = data.result;
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
                "Odbij",
                style: TextStyle(color: Colors.white),
              )),
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
        child: PaginatedDataTable(
          showCheckboxColumn: false,
          headingRowColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 46, 92, 232)),
          showEmptyRows: false,
          source: _DataSource(data: result!),
          columns: const [
            DataColumn(
              label: Expanded(
                child: Text(
                  'Korisnik',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Datum',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Status',
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
  final List<Rezervacija> data;

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
        selected: index == rezervacijaStream.value ? true : false,
        onSelectChanged: (value) {
          KorisnikData.rezervacijaStatus = e;
          rezervacijaStream.add(index);
        },
        color: MaterialStateProperty.resolveWith(_getDataRowColor),
        cells: [
          DataCell(Text(e.korisnik.toString())),
          DataCell(
              Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(e.datum!)))),
          DataCell(Text(e.status.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
