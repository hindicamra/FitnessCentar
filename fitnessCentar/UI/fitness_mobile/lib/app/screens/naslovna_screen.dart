import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/providers/naslovna_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NaslovnaScreen extends StatefulWidget {
  final UserModel userModel;

  const NaslovnaScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<NaslovnaScreen> createState() => _NaslovnaScreenState();
}

class _NaslovnaScreenState extends State<NaslovnaScreen> {
  late NaslovnaProvider homeProvider;

  @override
  void initState() {
    super.initState();
    homeProvider = context.read<NaslovnaProvider>();
    homeProvider.setUserModelData(widget.userModel);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ValueListenableBuilder(
      valueListenable: homeProvider.currentPageIndex,
      builder: (context, value, _) {
        return Provider<int>.value(
          value: value,
          child: Scaffold(
            //TODO set floating action button for screens, handle on witch screen it can be seen
            // floatingActionButton: ,
            appBar: AppBar(
              title: Text(
                homeProvider.getTitle(),
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
            body: IndexedStack(
              index: homeProvider.currentPageIndex.value,
              children: homeProvider.listOfPages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              currentIndex: homeProvider.currentPageIndex.value,
              selectedFontSize: 14,
              selectedIconTheme:
                  const IconThemeData(size: 28, color: Colors.white),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              unselectedFontSize: 12,
              unselectedIconTheme:
                  const IconThemeData(size: 23, color: Colors.black),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Naslovna',
                  activeIcon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                  ),
                  label: 'Termini',
                  activeIcon: Icon(
                    Icons.calendar_month,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store_outlined,
                  ),
                  label: 'Proizvodi',
                  activeIcon: Icon(
                    Icons.store,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border_outlined,
                  ),
                  label: 'Recenzije',
                  activeIcon: Icon(
                    Icons.star,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                  ),
                  label: 'Profil',
                  activeIcon: Icon(
                    Icons.account_circle,
                  ),
                ),
              ],
              onTap: (int index) {
                setState(() {
                  homeProvider.changeTabIndex(index);
                });
              },
            ),
            // NavigationBarTheme(
            //   data: NavigationBarThemeData(
            //     labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            //       (Set<MaterialState> states) =>
            //           states.contains(MaterialState.selected)
            //               ? const TextStyle(
            //                   color: Colors.white, fontWeight: FontWeight.bold)
            //               : const TextStyle(color: Colors.black),
            //     ),
            //   ),
            //   child: ,
            //   // NavigationBar(
            //   //   backgroundColor: Colors.blue,
            //   //   onDestinationSelected: (int index) {
            //   //     homeProvider.changeTabIndex(index);
            //   //   },
            //   //   indicatorColor: Colors.white,
            //   //   selectedIndex: homeProvider.currentPageIndex.value,
            //   //   destinations: const <Widget>[
            //   //     NavigationDestination(
            //   //       icon: Icon(Icons.account_circle_outlined),
            //   //       selectedIcon:
            //   //           Icon(Icons.account_circle, color: Colors.blue),
            //   //       label: 'Profil',
            //   //     ),
            //   //   ],
            //   // ),
            // ),
            // body: <Widget>[
            //   /// Home page widget
            //   const NaslovnaScreenWidget(),
            //
            //   /// Termini page widget
            //   const TerminScreen(),
            //
            //   /// Proizvodi page widget
            //   const ProizvodiScreen(),
            //
            //   /// Recenzije page widget
            //   const Card(
            //     shadowColor: Colors.transparent,
            //     child: SizedBox.expand(
            //       child: Center(
            //         child: Text(
            //           'Recenzije page',
            //           style: TextStyle(color: Colors.black),
            //         ),
            //       ),
            //     ),
            //   ),
            //
            //   /// Profil page widget
            //   const Card(
            //     shadowColor: Colors.transparent,
            //     child: SizedBox.expand(
            //       child: Center(
            //         child: Text(
            //           'Profil page',
            //           style: TextStyle(color: Colors.black),
            //         ),
            //       ),
            //     ),
            //   ),
            // ][homeProvider.currentPageIndex.value],
          ),
        );
      },
    ));
  }
}
