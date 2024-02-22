import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/providers/pregled_treninga_provider.dart';
import 'package:fitness_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class PregledTreningaScreen extends StatefulWidget {
  const PregledTreningaScreen({super.key});

  @override
  State<PregledTreningaScreen> createState() => _PregledTreningaScreenState();
}

class _PregledTreningaScreenState extends State<PregledTreningaScreen> {
  late PregledTreningaProvider pregledTreningaProvider;

  @override
  void initState() {
    pregledTreningaProvider = context.read<PregledTreningaProvider>();
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
          'Pregled Treninga',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Dodaj trening tag',
        onPressed: () =>
            pregledTreningaProvider.goToDodajTreningScreen(context),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
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
                  child: FormBuilder(
                    key: pregledTreningaProvider.formKey,
                    child: FormBuilderDateTimePicker(
                      inputType: InputType.date,
                      name: pregledTreningaProvider.formName,
                      firstDate: DateTime(2024, 1, 1),
                      lastDate: DateTime.now(),
                      format: AppConstants.dateFormat,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        labelText: 'Izaberite datum',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextButton(
                    onPressed: () => pregledTreningaProvider.searchApi(),
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
              valueListenable: pregledTreningaProvider.listItems,
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
                                onTap: () => pregledTreningaProvider
                                    .goToDetaljiTreningaScreen(
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
                                              'Duzina trajanja: ${value[index].duration} h',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Trener: ${value[index].trainer}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tip treninga: ${value[index].typeOfTraining}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Cena: ${value[index].price} €',
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
