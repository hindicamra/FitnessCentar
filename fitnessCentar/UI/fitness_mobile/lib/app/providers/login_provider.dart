import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/providers/naslovna_provider.dart';
import 'package:fitness_mobile/app/providers/profil_provider.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:fitness_mobile/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  UserModel? userModel;

  goToRegisterScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.register);
  }

  sendLoginApiCall(BuildContext context) async {
    /// For testing now without backend data
    if (email.text.isNotEmpty &&
        Utils().isValidEmail(email.text) &&
        password.text.length > 3) {
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

      NaslovnaProvider naslovnaProvider = context.read<NaslovnaProvider>();
      naslovnaProvider.setUserModelData(userModel!);
      ProfilProvider profilProvider = context.read<ProfilProvider>();
      profilProvider.setUserModel(userModel!);
      Navigator.popAndPushNamed(context, AppRoutes.naslovna);

      context.loaderOverlay.hide();
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => NaslovnaScreen(
      //       userModel: userModel!,
      //     ),
      //   ),
      // );

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
          content: const Text("Neispravni email ili lozinka!"),
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
}
