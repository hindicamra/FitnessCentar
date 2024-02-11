import 'package:fitness_mobile/app/models/training_model.dart';
import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentPageIndex = 0.obs;
  UserModel? userModel;
  var refreshing = false.obs;

  @override
  void onInit() {
    super.onInit();
    userModel = Get.arguments as UserModel;
  }

  void changeTabIndex(int index) {
    currentPageIndex.value = index;
  }

  getUserDataFromApi(BuildContext context) async {
    /// Mock data for now
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    userModel?.listOfActiveTrainings.add(
      TrainingModel(
        1,
        '6/6/2024',
        2,
        'Trainer 5',
        'Neck',
      ),
    );
    refreshing.value = false;
    // final dio = Dio();
    // Response response = await dio.get('${AppConstants().baseUrl}userid?userModel?.userId');
    //
    // if (Utils().isValidResponse(response)) {
    //   UserModel userModel = UserModel.fromJson(response.data);
    //   refreshing.value = false;
    // } else {
    //   // ignore: use_build_context_synchronously
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: const Text('Upozorenje'),
    //       content: const Text(
    //           "Desila se greška"),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context)
    //                 .pop(); // Close the alert
    //           },
    //           child: const Text('OK'),
    //         )
    //       ],
    //     ),
    //   );
    // }
  }
}
