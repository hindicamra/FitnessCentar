import 'package:fitness_admin/providers/home_provider.dart';
import 'package:fitness_admin/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    homeProvider = context.read<HomeProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          width: 250,
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
                    homeProvider.userModel?.ulogaId == 1
                        ? ListTile(
                            title: const Text('Upravljanje zaposlenima'),
                            onTap: () => homeProvider
                                .goToUpravljanjeZaposlenimaScreen(context),
                          )
                        : Container(),
                    ListTile(
                      title: const Text('Upravljanje korisnicima'),
                      onTap: () => homeProvider
                          .goToUpravljanjeKorisnicimaScreen(context),
                    ),
                    ListTile(
                      title: const Text('Pregled raspored treninga'),
                      onTap: () =>
                          homeProvider.goToPregledTreningaScreen(context),
                    ),
                    ListTile(
                      title: const Text('Odjava'),
                      onTap: () {
                        Navigator.popAndPushNamed(context, AppRoutes.login);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text('Dobrodošli',
                  style: TextStyle(fontSize: 42, color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
