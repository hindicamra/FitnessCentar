// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:fitness_centar_web/models/izvjestaj.dart';
import 'package:fitness_centar_web/models/izvjestaj_rezervacije.dart';
import 'package:fitness_centar_web/providers/izvjestaj_provider.dart';
import 'package:fitness_centar_web/providers/izvjestaj_recenzija_provider.dart';
import 'package:fitness_centar_web/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IzvjestajScreen extends StatefulWidget {
  static const String routeName = "/Izvjestaj";
  const IzvjestajScreen({super.key});

  @override
  State<IzvjestajScreen> createState() => _RecenzijeScreenState();
}

class _RecenzijeScreenState extends State<IzvjestajScreen> {
  late IzvjestajProvider _izvjestajProvider;
  Izvjestaj? resultZaposlenici;
  Izvjestaj? rezultatKorisnici;
  IzvjestajRezervacije? rezultatRezervacije;
  IzvjestajRecenzijeProvider? _izvjestajRecenzijaProvider;

  @override
  void initState() {
    super.initState();
    _izvjestajProvider = context.read<IzvjestajProvider>();
    _izvjestajRecenzijaProvider = context.read<IzvjestajRecenzijeProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var dataZaposlenik = await _izvjestajProvider.getIzvjestaj('zaposlenici');
    var dataKorisnik = await _izvjestajProvider.getIzvjestaj('korisnici');
    var dataRezervacije =
        await _izvjestajRecenzijaProvider!.getIzvjestajRecenzija('rezervacije');
    setState(() {
      resultZaposlenici = dataZaposlenik;
      rezultatKorisnici = dataKorisnik;
      rezultatRezervacije = dataRezervacije;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Izvjestaj",
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

  Widget _buildDataListView() {
    if (resultZaposlenici == null) {
      return Container();
    }

    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Zaposlenici',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text('Aktivni: '),
                            Text(resultZaposlenici!.aktivni.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Neaktivni: '),
                            Text(resultZaposlenici!.neAktivni.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Ukupno: '),
                            Text(resultZaposlenici!.neAktivni.toString()),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(''),
                            Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Korisnici',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text('Aktivni: '),
                            Text(rezultatKorisnici!.aktivni.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Neaktivni: '),
                            Text(rezultatKorisnici!.neAktivni.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Ukupno: '),
                            Text(rezultatKorisnici!.neAktivni.toString()),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(''),
                            Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Rezervacije',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text('Na čekanju: '),
                            Text(rezultatRezervacije!.naCekanju.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Odobreno: '),
                            Text(rezultatRezervacije!.odobreno.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Odbijeni: '),
                            Text(rezultatRezervacije!.odbijeno.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Ukupno: '),
                            Text(rezultatRezervacije!.ukupno.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
