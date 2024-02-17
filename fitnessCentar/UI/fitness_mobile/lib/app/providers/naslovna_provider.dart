import 'package:fitness_mobile/app/models/training_model.dart';
import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:fitness_mobile/app/screens/naslovna_screen_widget.dart';
import 'package:fitness_mobile/app/screens/profil_screen.dart';
import 'package:fitness_mobile/app/screens/proizvodi_screen.dart';
import 'package:fitness_mobile/app/screens/recenzije_screen.dart';
import 'package:fitness_mobile/app/screens/termin_screen.dart';
import 'package:flutter/material.dart';

class NaslovnaProvider extends ChangeNotifier {
  ValueNotifier<int> currentPageIndex = ValueNotifier(0);
  ValueNotifier<bool> refreshing = ValueNotifier(false);
  late UserModel userModel;
  final List<Widget> listOfPages = [
    const NaslovnaScreenWidget(),
    const TerminScreen(),
    const ProizvodiScreen(),
    const RecenzijaScreen(),
    const ProfilScreen(),
  ];

  setUserModelData(UserModel userModelData) {
    userModel = userModelData;
  }

  void changeTabIndex(int index) {
    currentPageIndex.value = index;
  }

  getUserDataFromApi(BuildContext context) async {
    /// Mock data for now
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    userModel.listOfActiveTrainings?.add(
      TrainingModel(
        1,
        '6/6/2024',
        2,
        'Trainer 5',
        'Neck',
        500,
      ),
    );
    refreshing.value = false;
    //TODO get all trainings from api on pull to refresh
  }

  String getTitle() {
    String title = '';
    switch (currentPageIndex.value) {
      case 0:
        title = 'Naslovna';
        break;
      case 1:
        title = 'Termini';
        break;
      case 2:
        title = 'Proizvodi';
        break;
      case 3:
        title = 'Recenzije';
        break;
      case 4:
        title = 'Profil';
        break;
    }
    return title;
  }
}
