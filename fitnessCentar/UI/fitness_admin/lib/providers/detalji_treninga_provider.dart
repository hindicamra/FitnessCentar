import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DetaljiTreningaProvider extends ChangeNotifier {
  TrainingModel? trainingModel;

  final formKey = GlobalKey<FormBuilderState>();
  final String formName = 'date';
  DateTime? dateTime;

  TextEditingController duration = TextEditingController();
  TextEditingController trainer = TextEditingController();
  TextEditingController typeOfTraining = TextEditingController();
  TextEditingController price = TextEditingController();

  setTrainingModel(TrainingModel trainingModelData) {
    trainingModel = trainingModelData;
  }

  setData() async {
    dateTime = AppConstants.dateFormat.tryParse(trainingModel?.date ?? '');
    duration.text = trainingModel?.duration.toString() ?? '';
    trainer.text = trainingModel?.trainer ?? '';
    typeOfTraining.text = trainingModel?.typeOfTraining ?? '';
    price.text = trainingModel?.price.toString() ?? '';
  }

  saveTraining(BuildContext context) {
    //TODO send api call to save user
    Navigator.pop(context, true);
  }

  deleteTraining(BuildContext context) {
    //TODO send api call to delete user
    Navigator.pop(context, true);
  }
}
