// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:fitness_centar_web/models/plan_ishrane_korisnika.dart';
import 'package:fitness_centar_web/providers/plan_ishrane_korisnika_provider.dart';
import 'package:fitness_centar_web/screen/plan_ishrane_dodaj_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:fitness_centar_web/screen/plan_ishrane_dodaj_uredi_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_result.dart';
import '../utils/util.dart';

final planIshraneStream = BehaviorSubject<int>.seeded(-1);

class PlanIshraneScreen extends StatefulWidget {
  static const String routeName = "/Plan ishrane";
  const PlanIshraneScreen({super.key});

  @override
  State<PlanIshraneScreen> createState() => _PlanIshraneScreenState();
}

class _PlanIshraneScreenState extends State<PlanIshraneScreen> {
  late PlanIshraneKorisnikaProvider _planIshraneKorisnikaProvider;
  SearchResult<PlanIshraneKorisnika>? result;
  final TextEditingController _nazivController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _planIshraneKorisnikaProvider =
        context.read<PlanIshraneKorisnikaProvider>();
    planIshraneStream.add(-1);
    KorisnikData.planIshraneKorisnika = null;
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _planIshraneKorisnikaProvider.get(filter: {
      'ImePrezime': null,
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
          "Plan ishrane",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: InkWell(
        onTap: () {
          planIshraneStream.add(-1);
          KorisnikData.planIshraneKorisnika = null;
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
              decoration: const InputDecoration(labelText: "Naziv"),
              controller: _nazivController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _planIshraneKorisnikaProvider.get(filter: {
                  'ImePrezime': _nazivController.text,
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
              if (KorisnikData.planIshraneKorisnika == null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlanIshraneDodajScreen(),
                  ),
                );
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlanIshraneDodajUrediScreen(
                      planIshrane: KorisnikData.planIshraneKorisnika,
                    ),
                  ),
                );
              }
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
            stream: planIshraneStream.stream,
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
                        'Korisnicko ime',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Planovi ishrane',
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
  final List<PlanIshraneKorisnika> data;

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
    //return Colors.green; // Use the default value.
    return Colors.transparent;
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final e = data[index];

    return DataRow(
        selected: index == planIshraneStream.value ? true : false,
        onSelectChanged: (selected) {
          KorisnikData.planIshraneKorisnika = e;
          planIshraneStream.add(index);
        },
        color: MaterialStateProperty.resolveWith(_getDataRowColor),
        cells: [
          DataCell(Text(e.korisnik.toString())),
          DataCell(Text(e.korisnik.toString())),
          DataCell(Text(e.planIshrane.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
