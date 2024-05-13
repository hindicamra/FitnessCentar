import 'dart:convert';

import 'package:fitness_centar_web/models/izvjestaj.dart';
import 'package:http/http.dart' as http;
import 'base_provider.dart';

class IzvjestajProvider extends BaseProvider<Izvjestaj> {
  IzvjestajProvider() : super("Izvjestaj");

  @override
  Izvjestaj fromJson(data) {
    return Izvjestaj.fromJson(data);
  }

  Future<Izvjestaj> getIzvjestaj(String izvjestaj) async {
    var url = "$fullUrl/$izvjestaj";
    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http.get(
      uri,
      headers: headers,
    );

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Izvjestaj list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
