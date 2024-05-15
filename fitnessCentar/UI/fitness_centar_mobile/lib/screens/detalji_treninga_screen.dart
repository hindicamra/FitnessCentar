import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/preporuka.dart';
import '../models/trening.dart';
import '../providers/preporuka_provider.dart';
import '../providers/rezervacija_list_provider.dart';
import '../providers/treninzi_list_provider.dart';
import '../utils/util.dart';

class DetaljiTreningaScreen extends StatefulWidget {
  const DetaljiTreningaScreen({Key? key}) : super(key: key);
  static const String routeName = "/detaljiTreninga";

  @override
  State<DetaljiTreningaScreen> createState() => _DetaljiTreningaScreenState();
}

class _DetaljiTreningaScreenState extends State<DetaljiTreningaScreen> {
  TreninziListProvider? _treningListProvider;
  Trening? data;
  RezervacijaListProvider? _rezervacijaProvider;
  PreporukaProvider? _preporukaProvider;

  List<Preporuka>? preporuka;
  String? naziv;
  String? opis;
  @override
  void initState() {
    super.initState();
    _treningListProvider = context.read<TreninziListProvider>();
    _rezervacijaProvider = context.read<RezervacijaListProvider>();
    _preporukaProvider = context.read<PreporukaProvider>();
    TreningIdRouteData.id;

    loadData(TreningIdRouteData.id!);
  }

  Future loadData(int args) async {
    var tmpData = await _treningListProvider!.getById(args);
    var tmpDataPreporuka = await _preporukaProvider!
        .getPreporuka(Authorization.korisnik!.korisnikId!);
    setState(() {
      data = tmpData;
      preporuka = tmpDataPreporuka;
      naziv = data?.naziv;
      opis = data?.opis;
    });
  }

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        confirmText: "Rezervisi",
        helpText: "Izaberi datum",
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              datePickerTheme: DatePickerThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  backgroundColor: Colors.white),
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 23, 121, 251),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
      setState(() {
        selectedDate = selectedDate;
      });
      Map rezervacijaData = {
        "treningId": TreningIdRouteData.id!,
        "korisnikId": Authorization.korisnik!.korisnikId!,
        "datum": selectedDate.toIso8601String(),
      };

      var response =
          await _rezervacijaProvider!.rezervacijaTreninga(rezervacijaData);
      if (response == "[Već ste rezervisali za ovaj datum]") {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Upozorenje"),
            content: const Text("Već ste rezervisali za ovaj datum"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else if (response == "[Rezervacija nije moguća za prošle datume]") {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Upozorenje"),
            content: const Text("Rezervacija nije moguća za prošle datume"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Trening rezervisan"),
          backgroundColor: Color.fromARGB(255, 46, 92, 232),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Odabir datuma",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: (data == null)
          ? const Center(
              child: Text("Nema podataka za prikaz"),
            )
          : SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                naziv!,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                opis!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text(
                            'Izaberi datum',
                            style: TextStyle(
                              color: Color.fromARGB(255, 23, 121, 251),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Preporuke',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: buildPreporukeWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<Widget> buildPreporukeWidget() {
    if (preporuka!.isEmpty) {
      return [
        const Center(
          child: Text("Nema podataka za prikaz"),
        )
      ];
    }

    List<Widget> list = preporuka!
        .map((e) => Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      TreningIdRouteData.id = e.trening!.treningId!;
                      naziv = e.trening!.naziv;
                      opis = e.trening!.opis;
                    });
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
                                    e.trening!.naziv!,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    e.trening!.opis!,
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
