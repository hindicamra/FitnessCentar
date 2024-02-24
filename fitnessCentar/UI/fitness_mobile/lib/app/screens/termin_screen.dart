import 'package:fitness_mobile/app/providers/termin_provider.dart';
import 'package:fitness_mobile/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class TerminScreen extends StatefulWidget {
  const TerminScreen({super.key});

  @override
  State<TerminScreen> createState() => _TerminScreenState();
}

class _TerminScreenState extends State<TerminScreen> {
  late TerminProvider terminProvider;

  @override
  void initState() {
    super.initState();
    terminProvider = context.read<TerminProvider>();
    terminProvider.searchWithDate(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          FormBuilder(
            key: terminProvider.formKey,
            child: FormBuilderDateRangePicker(
              name: terminProvider.formName,
              firstDate: DateTime(2024, 1, 1),
              lastDate: DateTime.now(),
              format: AppConstants.dateFormat,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                labelText: 'Izaberite od do vreme',
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => terminProvider.resetDate(),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                        child: Text(
                      'Resetuj datum',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => terminProvider.searchWithDate(false),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                        child: Text(
                      'Pretrazi',
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
          ValueListenableBuilder(
            valueListenable: terminProvider.refreshing,
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
                      : terminProvider.listOfTrainings.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Nema nijednog treninga za zadati datum',
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
                                      terminProvider.searchWithDate(false),
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
                                  terminProvider.searchWithDate(false),
                              child: ListView.builder(
                                itemCount:
                                    terminProvider.listOfTrainings.length,
                                padding: const EdgeInsets.only(top: 30),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => terminProvider.showDialogToBuy(
                                        context,
                                        terminProvider.listOfTrainings[index]),
                                    child: Card(
                                      elevation: 5,
                                      margin: const EdgeInsets.only(top: 20),
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Trainer: ${terminProvider.listOfTrainings[index].trainer}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Datum: ${terminProvider.listOfTrainings[index].date}',
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
                                                Expanded(
                                                  child: Text(
                                                    'Trajanje: ${terminProvider.listOfTrainings[index].duration} h',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Tip vezbe: ${terminProvider.listOfTrainings[index].typeOfTraining}',
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
                                                Expanded(
                                                  child: Text(
                                                    'Cena: ${terminProvider.listOfTrainings[index].price} €',
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
      ),
    );
  }
}
