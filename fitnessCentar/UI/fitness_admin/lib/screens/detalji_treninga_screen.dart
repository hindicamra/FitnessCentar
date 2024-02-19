import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/providers/detalji_treninga_provider.dart';
import 'package:fitness_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class DetaljiTreningaScreen extends StatefulWidget {
  const DetaljiTreningaScreen({super.key});

  @override
  State<DetaljiTreningaScreen> createState() => _DetaljiTreningaScreenState();
}

class _DetaljiTreningaScreenState extends State<DetaljiTreningaScreen> {
  late DetaljiTreningaProvider detaljiTreningaProvider;

  @override
  void initState() {
    detaljiTreningaProvider = context.read<DetaljiTreningaProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trainingModel =
        ModalRoute.of(context)!.settings.arguments as TrainingModel;
    detaljiTreningaProvider.setTrainingModel(trainingModel);
    detaljiTreningaProvider.setData();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Trener: ${detaljiTreningaProvider.trainingModel?.trainer}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Datum Treninga: ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: FormBuilder(
                          key: detaljiTreningaProvider.formKey,
                          child: FormBuilderDateTimePicker(
                            initialValue: detaljiTreningaProvider.dateTime,
                            inputType: InputType.date,
                            name: detaljiTreningaProvider.formName,
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
                              labelText: 'Datum Treninga',
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Trajanje treninga: ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.number,
                          controller: detaljiTreningaProvider.duration,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText: "Trajanje treninga",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trener: ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.name,
                          controller: detaljiTreningaProvider.trainer,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText: "Trener",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Tip Treninga: ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.name,
                          controller: detaljiTreningaProvider.typeOfTraining,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText: "Tip treninga",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cena: ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.number,
                          controller: detaljiTreningaProvider.price,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                            hintText: "Cena",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextButton(
                      onPressed: () =>
                          detaljiTreningaProvider.saveUser(context),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          'Sačuvaj',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextButton(
                      onPressed: () =>
                          detaljiTreningaProvider.deleteUser(context),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          'Obriši',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
