import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PregledTreningaProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  final String formName = 'date';
  String? date;
  ValueNotifier<List<TrainingModel>> listItems = ValueNotifier([]);

  searchApi() {
    //TODO Send api call here now use mock
    listItems.value.add(
      TrainingModel(
        1,
        '22/01/2024',
        2,
        'Trainer TEST',
        'Arms',
        200,
      ),
    );
    listItems.notifyListeners();
  }

  goToDetaljiTreningaScreen(
      TrainingModel trainingModel, BuildContext context) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.detaljiTreninga,
      arguments: trainingModel,
    ).then((val) {
      bool? data = val as bool?;
      if (data ?? false) {
        searchApi();
      }
    });
  }

  goToDodajTreningScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dodajTrening);
  }
}
