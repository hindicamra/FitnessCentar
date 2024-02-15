import 'package:fitness_mobile/app/providers/recenzije_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RecenzijaScreen extends StatefulWidget {
  const RecenzijaScreen({super.key});

  @override
  State<RecenzijaScreen> createState() => _RecenzijaScreenState();
}

class _RecenzijaScreenState extends State<RecenzijaScreen> {
  late RecenzijeProvider recenzijeProvider;

  @override
  void initState() {
    super.initState();
    recenzijeProvider = context.read<RecenzijeProvider>();
    recenzijeProvider.getAllRatings();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: recenzijeProvider.refreshing,
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
                        : recenzijeProvider.listOfRating.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Nema nijedne recenzije',
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
                                        recenzijeProvider.getAllRatings(),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                    recenzijeProvider.getAllRatings(),
                                child: ListView.builder(
                                  itemCount:
                                      recenzijeProvider.listOfRating.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      elevation: 5,
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: recenzijeProvider
                                                  .listOfRating[index].rating
                                                  .toDouble(),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              ignoreGestures: true,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    'Komentar: \n ${recenzijeProvider.listOfRating[index].comment} ',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
        ));
  }
}
