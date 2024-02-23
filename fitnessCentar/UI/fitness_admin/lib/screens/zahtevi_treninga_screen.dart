import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/providers/zahtevi_treninga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZahteviTreningaScreen extends StatefulWidget {
  const ZahteviTreningaScreen({super.key});

  @override
  State<ZahteviTreningaScreen> createState() => _ZahteviTreningaScreenState();
}

class _ZahteviTreningaScreenState extends State<ZahteviTreningaScreen> {
  late ZahteviTreningaProvider zahteviTreningaProvider;

  @override
  void initState() {
    zahteviTreningaProvider = context.read<ZahteviTreningaProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Zahtevi Treninga',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: zahteviTreningaProvider.search,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "Pretraga korisnika",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextButton(
                    onPressed: () => zahteviTreningaProvider.searchApi(),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: const Center(
                          child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
              valueListenable: zahteviTreningaProvider.listItems,
              builder: (context, value, _) {
                return Provider<List<TrainingModel>>.value(
                  value: value,
                  child: Expanded(
                    child: value.isEmpty
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Nema nijednog treninga',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: value.length,
                            controller: ScrollController(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => zahteviTreningaProvider
                                    .goToDetaljiZahtevTreningaScreen(
                                        value[index], context),
                                child: Card(
                                  elevation: 5,
                                  color: Colors.blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Datum: ${value[index].date}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Klient: ${value[index].userModel.korisnickoIme}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
