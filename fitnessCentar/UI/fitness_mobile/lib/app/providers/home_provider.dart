import 'package:fitness_mobile/app/models/training_model.dart';
import 'package:fitness_mobile/app/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  ValueNotifier<int> currentPageIndex = ValueNotifier(0);
  ValueNotifier<bool> refreshing = ValueNotifier(false);
  UserModel? userModel;

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
    userModel?.listOfActiveTrainings.add(
      TrainingModel(
        1,
        '6/6/2024',
        2,
        'Trainer 5',
        'Neck',
      ),
    );
    refreshing.value = false;
    //TODO get all trainings from api on pull to refresh
  }
}
