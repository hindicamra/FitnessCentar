import 'package:fitness_mobile/app/screens/homeScreen/controller/home_controller.dart';
import 'package:fitness_mobile/app/screens/homeScreen/widget/home_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Obx(() {
        return SafeArea(
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
                  controller.changeTabIndex(index);
                },
                indicatorColor: Colors.white,
                selectedIndex: controller.currentPageIndex.value,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home, color: Colors.blue),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
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
              HomeScreenWidget(controller),

              /// Termini page widget
              const Card(
                shadowColor: Colors.transparent,
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Termini page',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              /// Proizvodi page widget
              const Card(
                shadowColor: Colors.transparent,
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Proizvodi page',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

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
            ][controller.currentPageIndex.value],
          ),
        );
      }),
    );
  }
}
