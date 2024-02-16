import 'package:fitness_mobile/app/models/cart_model.dart';
import 'package:fitness_mobile/app/providers/korpa_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KorpaScreen extends StatefulWidget {
  const KorpaScreen({super.key});

  @override
  State<KorpaScreen> createState() => _ProizvodiScreenState();
}

class _ProizvodiScreenState extends State<KorpaScreen> {
  late KorpaProvider korpaProvider;

  @override
  void initState() {
    super.initState();
    korpaProvider = context.read<KorpaProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Korpa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: korpaProvider.listItems,
              builder: (context, value, _) {
                return Provider<List<CartModel>>.value(
                  value: value,
                  child: Expanded(
                    child: value.isEmpty
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Nema nijednog proizvoda',
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
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 5,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Ime proizvoda: ${value[index].name}',
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
                                          Text(
                                            'Cena: ${value[index].price} €',
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
                                      TextButton(
                                        onPressed: () => korpaProvider
                                            .removeItemFromCart(value[index]),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red,
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Obrisi proizvod',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                          )),
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
            Visibility(
              visible: korpaProvider.listItems.value.isNotEmpty,
              child: TextButton(
                onPressed: () => korpaProvider.buyAllItems(),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Center(
                      child: Text(
                    'Kupi',
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
      ),
    );
  }
}
