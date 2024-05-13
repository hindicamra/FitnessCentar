import 'dart:convert';
import 'package:fitness_centar_web/models/izvjestaj_rezervacije.dart';
import 'package:http/http.dart' as http;
import 'base_provider.dart';

class IzvjestajRecenzijeProvider extends BaseProvider<IzvjestajRezervacije> {
  IzvjestajRecenzijeProvider() : super("Izvjestaj");

  @override
  IzvjestajRezervacije fromJson(data) {
    return IzvjestajRezervacije.fromJson(data);
  }

  Future<IzvjestajRezervacije> getIzvjestajRecenzija(String izvjestaj) async {
    var url = "$fullUrl/$izvjestaj";
    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http.get(
      uri,
      headers: headers,
    );

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      IzvjestajRezervacije list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
