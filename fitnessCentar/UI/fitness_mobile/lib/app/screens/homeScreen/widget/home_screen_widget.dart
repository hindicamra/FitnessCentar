import 'package:fitness_mobile/app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.read<HomeProvider>();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dobrodošli ${homeProvider.userModel?.name ?? ''}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vaši nadolazeći termini:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: homeProvider.refreshing,
              builder: (context, value, _) {
                return Provider<bool>.value(
                  value: value,
                  child: Expanded(
                      child: value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            )
                          : (homeProvider.userModel?.listOfActiveTrainings
                                          .length ??
                                      0) ==
                                  0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Nema nadolazećih treninga',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                      onPressed: () => homeProvider
                                          .getUserDataFromApi(context),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue,
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Refrešuj listu',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              : RefreshIndicator(
                                  onRefresh: () =>
                                      homeProvider.getUserDataFromApi(context),
                                  child: ListView.builder(
                                    itemCount: homeProvider.userModel
                                            ?.listOfActiveTrainings.length ??
                                        0,
                                    padding: const EdgeInsets.only(top: 30),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        elevation: 5,
                                        margin: const EdgeInsets.only(top: 20),
                                        color: Colors.blue,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Trainer: - ${homeProvider.userModel!.listOfActiveTrainings[index].trainer}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Datum: - ${homeProvider.userModel!.listOfActiveTrainings[index].date}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Trajanje: - ${homeProvider.userModel!.listOfActiveTrainings[index].duration} h',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Tip vezbe: ${homeProvider.userModel!.listOfActiveTrainings[index].typeOfTraining}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )),
                );
              })
        ],
      ),
    );
  }
}
