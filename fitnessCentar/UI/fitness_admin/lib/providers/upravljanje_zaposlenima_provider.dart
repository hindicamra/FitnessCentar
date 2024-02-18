import 'package:fitness_admin/models/user_model.dart';
import 'package:flutter/material.dart';

class UpravljanjeZaposlenimaProvider extends ChangeNotifier {
  TextEditingController search = TextEditingController();
  ValueNotifier<List<UserModel>> listItems = ValueNotifier([]);

  searchApi() {
    //TODO Send api call here now use mock
    listItems.value.add(
      UserModel(
        1,
        'IME',
        'PREZIME',
        'KORISNIKO IME',
        'EMAIL',
        'TELEFON',
        'ADRESA',
        'STATUS',
        1,
      ),
    );
    listItems.notifyListeners();
  }
}
