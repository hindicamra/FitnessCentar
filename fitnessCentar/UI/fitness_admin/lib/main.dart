import 'package:fitness_admin/providers/login_provider.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:fitness_admin/screens/homepage_screen.dart';
import 'package:fitness_admin/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Centar',
      initialRoute: AppRoutes.login,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.naslovna: (context) => const HomepageScreen(),
      },
    );
  }
}
