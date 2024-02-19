import 'package:fitness_admin/models/user_model.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  UserModel? userModel;

  setUserModel(UserModel? userModelData) {
    userModel = userModelData;
  }

  goToUpravljanjeZaposlenimaScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.upravljanjeZaposlenima);
  }

  goToUpravljanjeKorisnicimaScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.upravljanjeKorinsicima);
  }
}
