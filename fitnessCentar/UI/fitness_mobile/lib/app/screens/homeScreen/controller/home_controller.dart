import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentPageIndex = 0.obs;
  UserModel? userModel;

  @override
  void onInit() {
    userModel = Get.arguments as UserModel;
    print(userModel?.name);
  }

  void changeTabIndex(int index) {
    currentPageIndex.value = index;
  }
}
