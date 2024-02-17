import 'package:flutter/material.dart';

class DodajRecenzijuProvider extends ChangeNotifier {
  TextEditingController komentar = TextEditingController();

  double rating = 1;

  addRecenziju(BuildContext context) {
    //TODO send api call to add rating
    Navigator.pop(context, true);
  }
}
