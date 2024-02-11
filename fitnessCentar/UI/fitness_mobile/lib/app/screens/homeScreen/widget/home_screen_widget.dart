import 'package:fitness_mobile/app/screens/homeScreen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenWidget extends StatelessWidget {
  final HomeController homeController;

  const HomeScreenWidget(this.homeController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dobrodošli ${homeController.userModel?.name ?? ''}',
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
            Expanded(
              child: homeController.refreshing.value
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    )
                  : (homeController.userModel?.listOfActiveTrainings.length ??
                              0) ==
                          0
                      ? const Center(
                          child: Text(
                            'Nema nadolazećih treninga',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () =>
                              homeController.getUserDataFromApi(context),
                          child: ListView.builder(
                            itemCount: homeController
                                    .userModel?.listOfActiveTrainings.length ??
                                0,
                            padding: const EdgeInsets.only(top: 30),
                            itemBuilder: (BuildContext context, int index) {
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
                                              'Trainer: - ${homeController.userModel!.listOfActiveTrainings[index].trainer}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Datum: - ${homeController.userModel!.listOfActiveTrainings[index].date}',
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
                                              'Trajanje: - ${homeController.userModel!.listOfActiveTrainings[index].duration} h',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Tip vezbe: ${homeController.userModel!.listOfActiveTrainings[index].typeOfTraining}',
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
                        ),
            ),
          ],
        ),
      );
    });
  }
}
