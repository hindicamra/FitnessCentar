// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:rxdart/rxdart.dart';
import 'package:fitness_centar_web/models/trening.dart';
import 'package:fitness_centar_web/providers/treninzi_list_provider.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_result.dart';
import '../utils/util.dart';
import 'trening_dodaj_uredi_screen.dart';

final treningStream = BehaviorSubject<int>.seeded(-1);

class TreningScreen extends StatefulWidget {
  static const String routeName = "/Trening";
  const TreningScreen({super.key});

  @override
  State<TreningScreen> createState() => _TreningScreenState();
}

class _TreningScreenState extends State<TreningScreen> {
  late TreninziListProvider _treninziListProvider;
  SearchResult<Trening>? result;
  TextEditingController _imePrezimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _treninziListProvider = context.read<TreninziListProvider>();
    treningStream.add(-1);
    KorisnikData.trening = null;
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _treninziListProvider.get(filter: {
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
          "Trening",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: InkWell(
        onTap: () {
          treningStream.add(-1);
          KorisnikData.trening = null;
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
          const Text("Unesite naziv treninga"),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: "trening"),
              controller: _imePrezimeController,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                var data = await _treninziListProvider.get(filter: {
                  'Naziv': _imePrezimeController.text,
                  'Page': 0,
                  'PageSize': 100,
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
                  builder: (context) => TreningDodajUrediScreen(
                    trening: KorisnikData.trening,
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
      child: Container(
        width: double.infinity,
        child: StreamBuilder<Object>(
            stream: treningStream.stream,
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
                        'Opis',
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
  final List<Trening> data;

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
        onLongPress: () {},
        selected: index == treningStream.value ? true : false,
        onSelectChanged: (selected) {
          KorisnikData.trening = e;
          treningStream.add(index);
        },
        color: MaterialStateProperty.resolveWith(_getDataRowColor),
        cells: [
          DataCell(
            Text(e.naziv.toString()),
          ),
          DataCell(Text(e.opis.toString())),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
