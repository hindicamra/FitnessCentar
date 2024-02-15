import 'package:fitness_mobile/app/models/rating_model.dart';
import 'package:flutter/material.dart';

class RecenzijeProvider extends ChangeNotifier {
  ValueNotifier<bool> refreshing = ValueNotifier(false);
  List<RatingModel> listOfRating = [];

  addRating() {
    //TODO go to rating page
  }

  getAllRatings() async {
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    //TODO Make api call here for now use mock data
    listOfRating.add(
      RatingModel(
        1,
        3,
        'TEST KOMENTAR',
      ),
    );
    refreshing.value = false;
  }
}
