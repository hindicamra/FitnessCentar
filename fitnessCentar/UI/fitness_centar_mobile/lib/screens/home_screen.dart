import 'package:fitness_centar_mobile/screens/clanarina_screen.dart';
import 'package:fitness_centar_mobile/screens/plan_ishrane.dart';
import 'package:fitness_centar_mobile/screens/profil_screen.dart';
import 'package:fitness_centar_mobile/screens/rezervacija_list_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/util.dart';
import 'treninzi_list_screen.dart';

final glbKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = <Widget>[
    const TreningListsScreen(),
    const RezervacijaListScreen(),
    const ClanarinaListScreen(),
    const PlanIshraneScreen(),
    ProfilScreen(),
  ];
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    if (index == 5) {
      Authorization.username = null;
      Authorization.password = null;

      Authorization.korisnik = null;

      Navigator.of(context)
          .pushNamedAndRemoveUntil(MyApp.routeName, (route) => false);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        key: glbKey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout_outlined), label: ''),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
