import 'dart:convert';

import 'package:fitness_centar_web/models/plan_ishrane.dart';
import 'package:fitness_centar_web/models/response_data.dart';
import 'package:fitness_centar_web/models/tip_clanarina.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/izvjestaj.dart';
import '../models/korisnik.dart';
import '../models/plan_ishrane_korisnika.dart';
import '../models/recenzija.dart';
import '../models/rezervacija.dart';
import '../models/trening.dart';
import '../models/uloga.dart';

class Authorization {
  static String? username;
  static String? password;
  static Korisnik? korisnik;
  static Uloga? uloga;
}

class KorisnikData {
  static Korisnik? korisnik;
  static Trening? trening;
  static Rezervacija? rezervacija;
  static TipClanarina? tipClanarina;
  static PlanIshrane? planIshrane;
  static Recenzija? recenzija;
  static Izvjestaj? izvjestaj;
  static Rezervacija? rezervacijaStatus;
  static PlanIshraneKorisnika? planIshraneKorisnika;
  static ResponseData? responseData;
}

Image imageFromBase64String(String base64Image) {
  return Image.memory(base64Decode(base64Image));
}

String formatDate(DateTime date) => DateFormat("dd/MM/yyyy").format(date);

String formatNumber(dynamic) {
  var f = NumberFormat('####,00');

  if (dynamic == null) {
    return "";
  }
  return f.format(dynamic);
}
