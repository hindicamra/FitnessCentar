import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:flutter/material.dart';

class UrediProfilProvider extends ChangeNotifier {
  late UserModel? userModel;

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  setUserModel(UserModel? userModelData) {
    userModel = userModelData;
    name.text = userModel?.name ?? '';
    surname.text = userModel?.surname ?? '';
    email.text = userModel?.email ?? '';
    age.text = (userModel?.age ?? '').toString();
    height.text = (userModel?.height ?? '').toString();
    weight.text = (userModel?.weight ?? '').toString();
  }

  editProfil(BuildContext context) {
    //TODO send api call to change edit profile.
    Navigator.pop(
      context,
      UserModel(
        null,
        name.text,
        surname.text,
        email.text,
        int.tryParse(age.text),
        int.tryParse(height.text),
        int.tryParse(weight.text),
        null,
      ),
    );
  }
}
