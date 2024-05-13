import 'package:fitness_centar_mobile/models/placanja.dart';
import 'dart:convert';

import 'base_provider.dart';

class PlacanjaProvider extends BaseProvider<Placanja> {
  PlacanjaProvider() : super("Placanja");

  @override
  Placanja fromJson(data) {
    return Placanja.fromJson(data);
  }

  Future<dynamic> placanjeClanarine(Map<dynamic, dynamic> clanarina) async {
    var url = "$fullUrl";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(clanarina);
    var headers = createHeaders();
    var response = await http!.post(uri, headers: headers, body: jsonRequest);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Placanja list = fromJson(data);
      return list;
    } else {
      throw Exception("Error");
    }
  }
}
