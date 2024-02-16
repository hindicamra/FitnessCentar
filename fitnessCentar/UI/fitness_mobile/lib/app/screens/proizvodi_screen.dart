import 'package:fitness_mobile/app/providers/cart_provider.dart';
import 'package:fitness_mobile/app/providers/proizvodi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProizvodiScreen extends StatefulWidget {
  const ProizvodiScreen({super.key});

  @override
  State<ProizvodiScreen> createState() => _ProizvodiScreenState();
}

class _ProizvodiScreenState extends State<ProizvodiScreen> {
  late ProizvodiProvider proizvodiProvider;
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    proizvodiProvider = context.read<ProizvodiProvider>();
    cartProvider = context.read<CartProvider>();
    proizvodiProvider.setCartProvider(cartProvider);
    proizvodiProvider.getAllListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('KLIK'),
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
                valueListenable: proizvodiProvider.refreshing,
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
                          : proizvodiProvider.listOfItems.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Nema nijednog proizvoda',
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
                                          proizvodiProvider.getAllListItems(),
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
                                      proizvodiProvider.getAllListItems(),
                                  child: ListView.builder(
                                    itemCount:
                                        proizvodiProvider.listOfItems.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            proizvodiProvider.showDialogToBuy(
                                          context,
                                          proizvodiProvider.listOfItems[index],
                                        ),
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
                                                      'Ime proizvoda: ${proizvodiProvider.listOfItems[index].name}',
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
                                                        'Opis proizvoda: ${proizvodiProvider.listOfItems[index].description}',
                                                        style: const TextStyle(
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
                                                      'Cena: ${proizvodiProvider.listOfItems[index].price} €',
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
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
