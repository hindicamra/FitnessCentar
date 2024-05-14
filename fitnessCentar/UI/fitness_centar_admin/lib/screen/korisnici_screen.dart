// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:rxdart/rxdart.dart';
import 'package:fitness_centar_web/models/korisnik.dart';
import 'package:fitness_centar_web/providers/korisnik_provider.dart';
import 'package:fitness_centar_web/screen/korisnici_dodaj_uredi_screen.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_result.dart';
import '../utils/util.dart';

final korisniciStream = BehaviorSubject<int>.seeded(-1);

class KorisniciScreen extends StatefulWidget {
  static const String routeName = "/Korisnici";
  const KorisniciScreen({super.key});

  @override
  State<KorisniciScreen> createState() => _KorisniciScreenState();
}

class _KorisniciScreenState extends State<KorisniciScreen> {
  late KorisnikProvider _korisnikProvider;
  SearchResult<Korisnik>? result;
  TextEditingController _imePrezimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _korisnikProvider = context.read<KorisnikProvider>();
    korisniciStream.add(-1);
    KorisnikData.korisnik = null;
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _korisnikProvider.get(filter: {
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
          "Korisnici",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: InkWell(
        onTap: () {
          korisniciStream.add(-1);
          KorisnikData.korisnik = null;
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
          const Text("Unesite Ime/Prezime"),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: "Ime i prezime"),
              controller: _imePrezimeController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _korisnikProvider.get(filter: {
                  'ImePrezime': _imePrezimeController.text,
                  'UlogaId': 3,
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
                  builder: (context) => KorisniciDodajUrediScreen(
                    korisnik: KorisnikData.korisnik,
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
            stream: korisniciStream.stream,
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
                        'Telefon',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Adresa',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Email',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Uloga',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Status',
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
  final List<Korisnik> data;

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
        selected: index == korisniciStream.value ? true : false,
        onSelectChanged: (selected) {
          KorisnikData.korisnik = e;
          korisniciStream.add(index);
        },
        color: MaterialStateProperty.resolveWith(_getDataRowColor),
        cells: [
          DataCell(
            Text('${e.ime.toString()} ${e.prezime.toString()}'),
          ),
          DataCell(Text(e.korisnickoIme.toString())),
          DataCell(Text(e.telefon.toString())),
          DataCell(Text(e.addresa.toString())),
          DataCell(Text(e.email.toString())),
          DataCell(Text(e.uloga.toString())),
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
