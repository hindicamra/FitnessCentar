import 'package:fitness_mobile/app/screens/homeScreen/controller/home_controller.dart';
import 'package:get/get.dart';

/// Handles bindings for home page controller
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
