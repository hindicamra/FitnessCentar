import 'package:fitness_admin/models/user_model.dart';
import 'package:fitness_admin/providers/upravljanje_zaposlenima_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpravljanjeZaposlenimaScreen extends StatefulWidget {
  const UpravljanjeZaposlenimaScreen({super.key});

  @override
  State<UpravljanjeZaposlenimaScreen> createState() =>
      _UpravljanjeZaposlenimaScreenState();
}

class _UpravljanjeZaposlenimaScreenState
    extends State<UpravljanjeZaposlenimaScreen> {
  late UpravljanjeZaposlenimaProvider upravljanjeZaposlenimaProvider;

  @override
  void initState() {
    upravljanjeZaposlenimaProvider =
        context.read<UpravljanjeZaposlenimaProvider>();
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
          'Zaposleni',
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
                    controller: upravljanjeZaposlenimaProvider.search,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "Pretraga",
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
                    onPressed: () => upravljanjeZaposlenimaProvider.searchApi(),
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
              valueListenable: upravljanjeZaposlenimaProvider.listItems,
              builder: (context, value, _) {
                return Provider<List<UserModel>>.value(
                  value: value,
                  child: Expanded(
                    child: value.isEmpty
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Nema nijednog zaposlenog',
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
                              return Card(
                                elevation: 5,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Id: ${value[index].korisnikId}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Ime: ${value[index].ime}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Prezime: ${value[index].prezime}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
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
