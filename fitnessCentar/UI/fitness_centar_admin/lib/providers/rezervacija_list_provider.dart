import 'dart:convert';

import '../models/rezervacija.dart';
import 'base_provider.dart';
import 'package:http/http.dart' as http;

class RezervacijaListProvider extends BaseProvider<Rezervacija> {
  RezervacijaListProvider() : super("Rezervacija");

  @override
  Rezervacija fromJson(data) {
    return Rezervacija.fromJson(data);
  }

  Future<dynamic> rezervacijaTreninga(Map<dynamic, dynamic> rezervacija) async {
    var url = "$fullUrl";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(rezervacija);
    var headers = createHeaders();
    var response = await http.post(uri, headers: headers, body: jsonRequest);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);

      return (data["errors"]["ERROR"].toString());
    } else if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Rezervacija list = fromJson(data);
      return list;
    } else {
      throw Exception("Error");
    }
  }

  Future<Rezervacija> updateRezervacija(
      Map<dynamic, dynamic> korisnik, int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(korisnik);
    var headers = createHeaders();
    var response = await http.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Rezervacija list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
