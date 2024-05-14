import 'dart:convert';

import '../models/korisnik.dart';
import '../utils/util.dart';
import 'base_provider.dart';
import 'package:http/http.dart' as http;

class KorisnikProvider extends BaseProvider<Korisnik> {
  KorisnikProvider() : super("Korisnik");

  @override
  Korisnik fromJson(data) {
    return Korisnik.fromJson(data);
  }

  Future<Korisnik> authenticate() async {
    String? username = Authorization.username!;
    String? password = Authorization.password!;
    var url = "$fullUrl/login?username=$username&password=$password";
    var uri = Uri.parse(url);

    var headers = {
      "Content-Type": "application/json",
    };
    var response = await http.post(uri, headers: headers);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Korisnik user = fromJson(data);
      return user;
    } else {
      throw Exception("Wrong username or password");
    }
  }

  Future<Korisnik> registar(
      Map<dynamic, dynamic> korisnik, String uloga) async {
    var url = "$fullUrl/$uloga";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(korisnik);
    var headers = {
      "Content-Type": "application/json",
    };
    var response = await http.post(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Korisnik list = fromJson(data);
      return list;
    } else {
      throw Exception("Error");
    }
  }

  Future<Korisnik> updateKorisnika(
      Map<dynamic, dynamic> korisnik, int id, String uloga) async {
    var url = "$fullUrl/$uloga?id=$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(korisnik);
    var headers = createHeaders();
    var response = await http.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Korisnik list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
