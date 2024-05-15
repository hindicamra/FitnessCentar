import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../providers/recenzija_provider.dart';
import '../utils/util.dart';

class RecenzijaDodajScreen extends StatefulWidget {
  const RecenzijaDodajScreen({Key? key}) : super(key: key);
  static const String routeName = "/recenzija_dodaj";

  @override
  State<RecenzijaDodajScreen> createState() => _RecenzijaDodajScreenState();
}

class _RecenzijaDodajScreenState extends State<RecenzijaDodajScreen> {
  RecenzijaProvider? _recenzijaProvider;
  TextEditingController _recenzijaController = TextEditingController();
  int? rating = 3;

  @override
  void initState() {
    super.initState();
    _recenzijaProvider = context.read<RecenzijaProvider>();
  }

  bool _validateSadrzajRecenzije(String? sadrzajRecenzije) {
    return sadrzajRecenzije != null && sadrzajRecenzije.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dodaj recenziju",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Ocjena:',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RatingBar(
                            itemSize: 40,
                            maxRating: 5,
                            minRating: 1,
                            initialRating: 3,
                            allowHalfRating: false,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star,
                                  color: Color.fromARGB(255, 253, 190, 0)),
                              half: const Icon(Icons.star,
                                  color: Color.fromARGB(255, 253, 190, 0)),
                              empty: const Icon(Icons.star, color: Colors.grey),
                            ),
                            onRatingUpdate: (rate) {
                              rating = rate.toInt();
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text('Sadržaj recenzije:',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                          TextField(
                            controller: _recenzijaController,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  String sadrzajRecenzije =
                                      _recenzijaController.text;
                                  if (_validateSadrzajRecenzije(
                                      sadrzajRecenzije)) {
                                    Map recenzija = {
                                      "korisnikID":
                                          Authorization.korisnik!.korisnikId,
                                      "treningId":
                                          RecenzijaTreningIdRouteData.id,
                                      "tekst": sadrzajRecenzije,
                                      "ocjena": rating,
                                      "rezervacijaId":
                                          RecenzijaTreningIdRouteData
                                              .rezervacijaId,
                                    };

                                    var response = await _recenzijaProvider!
                                        .dodajRecenziju(recenzija);
                                    if (response ==
                                        "[Ne mozete ocijeniti isti trening vise puta]") {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text("Upozorenje"),
                                          content: const Text(
                                              "Ne mozete ocijeniti isti trening vise puta"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (response ==
                                        "[Rezervacija ne postoji]") {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text("Upozorenje"),
                                          content: const Text(
                                              "Rezervacija ne postoji"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (response ==
                                        "[Nažalost, ne možete ostaviti recenziju za trening kojem niste prisustvovali]") {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text("Upozorenje"),
                                          content: const Text(
                                              "Nažalost, ne možete ostaviti recenziju za trening kojem niste prisustvovali"),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      Navigator.pop(context, true);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Recenzija uspješno dodana!"),
                                          backgroundColor:
                                              Color.fromARGB(255, 46, 92, 232),
                                        ),
                                      );
                                    }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Upozorenje"),
                                        content: const Text(
                                            "Sadržaj recenzije je obavezan!"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: const Text("Dodaj recenziju",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
