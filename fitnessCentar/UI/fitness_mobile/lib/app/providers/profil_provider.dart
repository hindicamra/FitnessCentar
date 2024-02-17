import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/providers/uredi_profil_provider.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilProvider extends ChangeNotifier {
  ValueNotifier<UserModel?> userModel = ValueNotifier(null);

  setUserModel(UserModel userModelData) {
    userModel.value = userModelData;
    userModel.notifyListeners();
  }

  editProfil(BuildContext context) async {
    UrediProfilProvider urediProfilProvider =
        context.read<UrediProfilProvider>();
    urediProfilProvider.setUserModel(userModel.value);
    await Navigator.pushNamed(
      context,
      AppRoutes.urediProfil,
    ).then((val) {
      UserModel? data = val as UserModel?;
      if (data != null) {
        setUserModel(data);
      }
    });
  }

  goToKorpaScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.korpa);
  }
}
