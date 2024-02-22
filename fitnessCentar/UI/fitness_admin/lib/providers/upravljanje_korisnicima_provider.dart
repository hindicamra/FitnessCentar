import 'package:fitness_admin/models/user_model.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UpravljanjeKorisnicimaProvider extends ChangeNotifier {
  TextEditingController search = TextEditingController();
  ValueNotifier<List<UserModel>> listItems = ValueNotifier([]);

  searchApi() {
    //TODO Send api call here now use mock
    listItems.value.add(
      UserModel(
        1,
        'IME KORISNIK',
        'PREZIME',
        'KORISNIKO IME',
        'EMAIL',
        'TELEFON',
        'ADRESA',
        'STATUS',
        1,
        'PLAN ISHRANE',
      ),
    );
    listItems.notifyListeners();
  }

  goToIzmenaKorisnikaScreen(UserModel userModel, BuildContext context) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.izmenaKorisnika,
      arguments: userModel,
    ).then((val) {
      bool? data = val as bool?;
      if (data ?? false) {
        searchApi();
      }
    });
  }
}
