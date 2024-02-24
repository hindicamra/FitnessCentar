import 'package:fitness_mobile/app/providers/clanarina_provider.dart';
import 'package:fitness_mobile/app/providers/korpa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClanarinaScreen extends StatefulWidget {
  const ClanarinaScreen({super.key});

  @override
  State<ClanarinaScreen> createState() => _ClanarinaScreenState();
}

class _ClanarinaScreenState extends State<ClanarinaScreen> {
  late ClanarinaProvider clanarinaProvider;
  late KorpaProvider korpaProvider;

  @override
  void initState() {
    super.initState();
    clanarinaProvider = context.read<ClanarinaProvider>();
    korpaProvider = context.read<KorpaProvider>();
    clanarinaProvider.setKorpaProvider(korpaProvider);
    clanarinaProvider.getAllListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'Clanarina tag',
        onPressed: () => clanarinaProvider.goToKorpaScreen(context),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: clanarinaProvider.refreshing,
                builder: (context, value, _) {
                  return Provider<bool>.value(
                    value: value,
                    child: Expanded(
                      child: value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            )
                          : clanarinaProvider.listOfItems.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Nema nijedne clanarine',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          clanarinaProvider.getAllListItems(),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue,
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Refrešuj listu',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              : RefreshIndicator(
                                  onRefresh: () =>
                                      clanarinaProvider.getAllListItems(),
                                  child: ListView.builder(
                                    itemCount:
                                        clanarinaProvider.listOfItems.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            clanarinaProvider.showDialogToBuy(
                                          context,
                                          clanarinaProvider.listOfItems[index],
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Card(
                                            elevation: 5,
                                            color: Colors.blue,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Članarina: ${clanarinaProvider.listOfItems[index].name}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          'Opis članarine: ${clanarinaProvider.listOfItems[index].description}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Cena: ${clanarinaProvider.listOfItems[index].price} €',
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
