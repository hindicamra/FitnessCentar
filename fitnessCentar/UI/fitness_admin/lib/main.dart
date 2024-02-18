import 'package:fitness_admin/providers/home_provider.dart';
import 'package:fitness_admin/providers/izmena_zaposlenih_provider.dart';
import 'package:fitness_admin/providers/login_provider.dart';
import 'package:fitness_admin/providers/upravljanje_zaposlenima_provider.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:fitness_admin/screens/homepage_screen.dart';
import 'package:fitness_admin/screens/izmena_zaposlenih_screen.dart';
import 'package:fitness_admin/screens/login_screen.dart';
import 'package:fitness_admin/screens/upravljanje_zaposlenima_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UpravljanjeZaposlenimaProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => IzmenaZaposlenihProvider(),
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
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: AppRoutes.login,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        AppRoutes.login: (context) => const LoaderOverlay(
              child: LoginScreen(),
            ),
        AppRoutes.naslovna: (context) => const HomepageScreen(),
        AppRoutes.upravljanjeZaposlenima: (context) =>
            const UpravljanjeZaposlenimaScreen(),
        AppRoutes.izmenaZaposlenih: (context) => const IzmenaZaposlenihScreen(),
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
