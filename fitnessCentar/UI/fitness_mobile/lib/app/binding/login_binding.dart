import 'package:fitness_mobile/app/screens/loginScreen/controller/login_controller.dart';
import 'package:get/get.dart';

/// Handles bindings for home page controller
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
