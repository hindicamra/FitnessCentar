import 'package:fitness_mobile/app/models/training_model.dart';
import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserModel? userModel;

  sendLoginApiCall(BuildContext context) async {
    /// For testing now without backend data
    if (formKey.currentState!.validate()) {
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
          TrainingModel(
            1,
            '12/12/2024',
            2,
            'Trainer 1',
            'Arms',
          ),
          TrainingModel(
            2,
            '05/05/2024',
            5,
            'Trainer 5',
            'Legs',
          ),
        ],
      );

      context.loaderOverlay.hide();
      Get.offAndToNamed(AppRoutes.home, arguments: userModel);

      // context.loaderOverlay.show();
      // final dio = Dio();
      // Response response = await dio.get('${AppConstants().baseUrl}login');
      //
      // if (Utils().isValidResponse(response)) {
      //   UserModel userModel = UserModel.fromJson(response.data);
      //   context.loaderOverlay.hide();
      //   Get.offAndToNamed(AppRoutes.home);
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
      //             Get.back();
      //           },
      //           child: const Text('OK'),
      //         )
      //       ],
      //     ),
      //   );
      // }
    }
  }
}
