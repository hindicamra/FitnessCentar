import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/providers/naslovna_provider.dart';
import 'package:fitness_mobile/app/providers/profil_provider.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:fitness_mobile/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  UserModel? userModel;

  registerUser(BuildContext context) async {
    /// For testing now without backend data
    if (checkFields() == '') {
      context.loaderOverlay.show();
      await Future.delayed(const Duration(seconds: 2));
      userModel = UserModel(
        1,
        'TEST',
        'TEST 123',
        '111@111.com',
        34,
        186,
        90,
        [
          // TrainingModel(
          //   1,
          //   '12/12/2024',
          //   2,
          //   'Trainer 1',
          //   'Arms',
          // ),
          // TrainingModel(
          //   2,
          //   '05/05/2024',
          //   5,
          //   'Trainer 5',
          //   'Legs',
          // ),
        ],
      );

      context.loaderOverlay.hide();
      NaslovnaProvider naslovnaProvider = context.read<NaslovnaProvider>();
      naslovnaProvider.setUserModelData(userModel!);
      ProfilProvider profilProvider = context.read<ProfilProvider>();
      profilProvider.setUserModel(userModel!);
      Navigator.popAndPushNamed(context, AppRoutes.naslovna);

      context.loaderOverlay.hide();

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (context) => NaslovnaScreen(
      //         userModel: userModel!,
      //       ),
      //     ),
      //     (route) => false);

      // context.loaderOverlay.show();
      // var url = Uri.https(AppConstants.baseUrl, 'login');
      // var response =
      //     await http.post(url, body: {'username': username.text, 'password': password.text});
      //
      // if (Utils().isValidResponse(response)) {
      //   UserModel userModel = UserModel.fromJson(response.data);
      //   context.loaderOverlay.hide();
      // Navigator.of(context).popAndPushNamed(AppRoutes.home, arguments: userModel);
      // } else {
      //   // ignore: use_build_context_synchronously
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //       title: const Text('Upozorenje'),
      //       content: const Text(
      //           "Neispravno korisničko ime ili lozinka!"),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: const Text('OK'),
      //         )
      //       ],
      //     ),
      //   );
      // }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Upozorenje'),
          content: Text("Neispravno polje ${checkFields()}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  String checkFields() {
    if (name.text.isEmpty || name.text.length < 3) {
      return 'Ime';
    } else if (surname.text.isEmpty || surname.text.length < 3) {
      return 'Prezime';
    } else if (email.text.isEmpty || !Utils().isValidEmail(email.text)) {
      return 'Email';
    } else if (password.text.isEmpty || password.text.length < 4) {
      return 'Lozinka';
    } else if (repeatPassword.text != password.text) {
      return 'Ponovljena lozinka';
    } else {
      return '';
    }
  }
}
