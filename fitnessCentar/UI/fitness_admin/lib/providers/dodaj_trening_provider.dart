import 'package:fitness_admin/models/training_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DodajTreningProvider extends ChangeNotifier {
  TrainingModel? trainingModel;

  final formKey = GlobalKey<FormBuilderState>();
  final String formName = 'date';
  DateTime? dateTime;

  TextEditingController duration = TextEditingController();
  TextEditingController trainer = TextEditingController();
  TextEditingController typeOfTraining = TextEditingController();
  TextEditingController price = TextEditingController();

  saveTraining(BuildContext context) {
    //TODO send api call to save user
    Navigator.pop(context);
  }
}
