import 'package:fitness_mobile/app/providers/dodaj_recenziju_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DodajRecenzijuScreen extends StatefulWidget {
  const DodajRecenzijuScreen({super.key});

  @override
  State<DodajRecenzijuScreen> createState() => _DodajRecenzijuScreenState();
}

class _DodajRecenzijuScreenState extends State<DodajRecenzijuScreen> {
  late DodajRecenzijuProvider dodajRatingProvider;

  @override
  void initState() {
    super.initState();
    dodajRatingProvider = context.read<DodajRecenzijuProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dodaj Recenziju',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                dodajRatingProvider.rating = rating;
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
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Komentar je obavezan!";
                } else if (value.length < 3) {
                  return "Komentar ne može imati manje od 3 slova";
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.black,
              ),
              controller: dodajRatingProvider.komentar,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: "Komentar",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => dodajRatingProvider.addRecenziju(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                    child: Text(
                  'Dodaj recenziju',
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
  }
}
