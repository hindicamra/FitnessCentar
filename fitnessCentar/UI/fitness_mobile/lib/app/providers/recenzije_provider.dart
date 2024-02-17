import 'package:fitness_mobile/app/models/rating_model.dart';
import 'package:fitness_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RecenzijeProvider extends ChangeNotifier {
  ValueNotifier<bool> refreshing = ValueNotifier(false);
  List<RatingModel> listOfRating = [];

  addRating(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.dodajRecenziju,
    ).then((val) {
      bool? data = val as bool?;
      if (data ?? false) {
        getAllRatings();
      }
    });
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
