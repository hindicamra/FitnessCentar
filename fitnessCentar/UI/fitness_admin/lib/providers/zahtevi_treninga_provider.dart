import 'package:fitness_admin/models/training_model.dart';
import 'package:fitness_admin/models/user_model.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ZahteviTreningaProvider extends ChangeNotifier {
  TextEditingController search = TextEditingController();
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
        UserModel(
          1,
          'IME',
          'PREZIME',
          'KORISNIKO IME',
          'EMAIL',
          'TELEFON',
          'ADRESA',
          1,
          1,
          'PLAN ISHRANE',
        ),
      ),
    );
    listItems.notifyListeners();
  }

  goToDetaljiZahtevTreningaScreen(
      TrainingModel trainingModel, BuildContext context) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.detaljiZahtevaTreninga,
      arguments: trainingModel,
    ).then((val) {
      bool? data = val as bool?;
      if (data ?? false) {
        searchApi();
      }
    });
  }
}
