import 'package:fitness_admin/screens/korisnici_screen.dart';
import 'package:fitness_admin/screens/login_screen.dart';
import 'package:fitness_admin/screens/uposlenici_screen.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: kToolbarHeight,
                color: Colors.blue,
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Korisnici'),
                      onTap: () {
                        _navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const KorisniciScreen()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Uposlenici'),
                      onTap: () {
                        _navigatorKey.currentState?.pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const UposleniciScreen()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Odjava'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                  builder: (context) => const MainContent());
            },
          ),
        ),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}
