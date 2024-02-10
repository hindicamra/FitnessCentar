import 'package:fitness_mobile/app/binding/home_bidning.dart';
import 'package:fitness_mobile/app/binding/login_binding.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:fitness_mobile/app/screens/homeScreen/widget/home_screen.dart';
import 'package:fitness_mobile/app/screens/loginScreen/widget/login_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
