import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/providers/naslovna_provider.dart';
import 'package:fitness_mobile/app/screens/naslovna_screen_widget.dart';
import 'package:fitness_mobile/app/screens/proizvodi_screen.dart';
import 'package:fitness_mobile/app/screens/termin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NaslovnaScreen extends StatelessWidget {
  const NaslovnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    NaslovnaProvider homeProvider = context.read<NaslovnaProvider>();
    homeProvider.setUserModelData(userModel);
    return SafeArea(
        child: ValueListenableBuilder(
      valueListenable: homeProvider.currentPageIndex,
      builder: (context, value, _) {
        return Provider<int>.value(
          value: value,
          child: Scaffold(
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)
                          : const TextStyle(color: Colors.black),
                ),
              ),
              child: NavigationBar(
                backgroundColor: Colors.blue,
                onDestinationSelected: (int index) {
                  homeProvider.changeTabIndex(index);
                },
                indicatorColor: Colors.white,
                selectedIndex: homeProvider.currentPageIndex.value,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home, color: Colors.blue),
                    icon: Icon(Icons.home_outlined),
                    label: 'Naslovna',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.calendar_today),
                    selectedIcon:
                        Icon(Icons.calendar_month, color: Colors.blue),
                    label: 'Termini',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.store_outlined),
                    selectedIcon: Icon(Icons.store, color: Colors.blue),
                    label: 'Proizvodi',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.star_border_outlined),
                    selectedIcon: Icon(Icons.star, color: Colors.blue),
                    label: 'Recenzije',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.account_circle_outlined),
                    selectedIcon:
                        Icon(Icons.account_circle, color: Colors.blue),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
            body: <Widget>[
              /// Home page widget
              const NaslovnaScreenWidget(),

              /// Termini page widget
              const TerminScreen(),

              /// Proizvodi page widget
              const ProizvodiScreen(),

              /// Recenzije page widget
              const Card(
                shadowColor: Colors.transparent,
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Recenzije page',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              /// Profil page widget
              const Card(
                shadowColor: Colors.transparent,
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Profil page',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ][homeProvider.currentPageIndex.value],
          ),
        );
      },
    ));
  }
}
