import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  UserModel? userModel;

  sendLoginApiCall(BuildContext context) async {
    /// For testing now without backend data
    if (username.text.isNotEmpty && password.text.length > 3) {
      context.loaderOverlay.show();
      await Future.delayed(const Duration(seconds: 2));
      userModel = UserModel(
        1,
        'TEST',
        'TEST 123',
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
      Navigator.of(context)
          .popAndPushNamed(AppRoutes.home, arguments: userModel);

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
          content: const Text("Neispravno korisničko ime ili lozinka!"),
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
