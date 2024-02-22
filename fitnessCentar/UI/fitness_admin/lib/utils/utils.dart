import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Authorization {
  static String? username;
  static String? password;
}

enum UserStatus {
  active(1),
  nonActive(2);

  const UserStatus(this.value);
  final int value;
}

enum UserRole {
  admin(1),
  user(2);

  const UserRole(this.value);
  final int value;
}

Image imageFromBase64String(String base64Image) {
  return Image.memory(base64Decode(base64Image));
}

String formatNumber(dynamic) {
  var f = NumberFormat('###,00');

  if (dynamic == null) {
    return "";
  }
  return f.format(dynamic);
}
