import 'package:fitness_mobile/app/binding/login_binding.dart';
import 'package:fitness_mobile/app/routes/app_pages.dart';
import 'package:fitness_mobile/app/screens/loginScreen/widget/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitness Centar',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: LoginBinding(),
      home: const LoaderOverlay(child: LoginScreen()),
      getPages: AppPages.pages,
    );
  }
}
