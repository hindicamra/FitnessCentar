import 'package:fitness_mobile/app/providers/cart_provider.dart';
import 'package:fitness_mobile/app/providers/login_provider.dart';
import 'package:fitness_mobile/app/providers/naslovna_provider.dart';
import 'package:fitness_mobile/app/providers/proizvodi_provider.dart';
import 'package:fitness_mobile/app/providers/recenzije_provider.dart';
import 'package:fitness_mobile/app/providers/termin_provider.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:fitness_mobile/app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NaslovnaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TerminProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProizvodiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecenzijeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Fitness Centar',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.login,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          AppRoutes.login: (context) =>
              const LoaderOverlay(child: LoginScreen()),
        },
      ),
    );
  }
}
