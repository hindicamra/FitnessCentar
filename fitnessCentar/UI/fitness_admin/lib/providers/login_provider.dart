import 'package:fitness_admin/models/user_model.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  UserModel? userModel;

  sendLoginApiCall(BuildContext context) async {
    /// For testing now without backend data
    if (username.text.length > 3 && password.text.length > 3) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      userModel = UserModel(
        1,
        'IME',
        'PREZIME',
        'KORISNIKO IME',
        'EMAIL',
        'TELEFON',
        'ADRESA',
        'STATUS',
        1,
      );

      Navigator.popAndPushNamed(context, AppRoutes.naslovna);

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
