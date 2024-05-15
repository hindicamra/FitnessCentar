import 'dart:convert';

import 'package:fitness_centar_mobile/models/clanarina.dart';
import 'package:fitness_centar_mobile/models/preporuka.dart';

import 'base_provider.dart';

class PreporukaProvider extends BaseProvider<Preporuka> {
  PreporukaProvider() : super("Preporuka");

  @override
  Preporuka fromJson(data) {
    return Preporuka.fromJson(data);
  }

  Future<List<Preporuka>> getPreporuka(int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http!.get(
      uri,
      headers: headers,
    );

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);

      List<Preporuka> list =
          data.map((x) => fromJson(x)).cast<Preporuka>().toList();
      return list;
    } else {
      throw Exception("Error");
    }
  }
}
