import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/providers/detalji_zahteva_treninga_provider.dart';
import 'package:fitness_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class DetaljiZahtevaTreningaScreen extends StatefulWidget {
  const DetaljiZahtevaTreningaScreen({super.key});

  @override
  State<DetaljiZahtevaTreningaScreen> createState() =>
      _DetaljiZahtevaTreningaScreenState();
}

class _DetaljiZahtevaTreningaScreenState
    extends State<DetaljiZahtevaTreningaScreen> {
  late DetaljiZahtevaTreningaProvider detaljiZahtevaTreningaProvider;

  @override
  void initState() {
    detaljiZahtevaTreningaProvider =
        context.read<DetaljiZahtevaTreningaProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trainingModel =
        ModalRoute.of(context)!.settings.arguments as TrainingModel;
    detaljiZahtevaTreningaProvider.setTrainingModel(trainingModel);
    detaljiZahtevaTreningaProvider.setData();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Klient: ${detaljiZahtevaTreningaProvider.trainingModel?.userModel.korisnickoIme}',
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
                          key: detaljiZahtevaTreningaProvider.formKey,
                          child: FormBuilderDateTimePicker(
                            initialValue:
                                detaljiZahtevaTreningaProvider.dateTime,
                            inputType: InputType.date,
                            name: detaljiZahtevaTreningaProvider.formName,
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
                          controller: detaljiZahtevaTreningaProvider.duration,
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
                          controller: detaljiZahtevaTreningaProvider.trainer,
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
                          controller:
                              detaljiZahtevaTreningaProvider.typeOfTraining,
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
                          controller: detaljiZahtevaTreningaProvider.price,
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
                      onPressed: () => detaljiZahtevaTreningaProvider
                          .approveTraining(context),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          'Prihvati',
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
                          detaljiZahtevaTreningaProvider.denyTraining(context),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          'Odbij',
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
