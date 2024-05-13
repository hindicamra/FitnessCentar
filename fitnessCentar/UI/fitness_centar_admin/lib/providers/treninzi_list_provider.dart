import 'dart:convert';

import '../models/trening.dart';
import 'base_provider.dart';
import 'package:http/http.dart' as http;

class TreninziListProvider extends BaseProvider<Trening> {
  TreninziListProvider() : super("Trening");

  @override
  Trening fromJson(data) {
    return Trening.fromJson(data);
  }

  Future<Trening> updateTreninga(Map<dynamic, dynamic> trening, int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(trening);
    var headers = createHeaders();
    var response = await http.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Trening list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
