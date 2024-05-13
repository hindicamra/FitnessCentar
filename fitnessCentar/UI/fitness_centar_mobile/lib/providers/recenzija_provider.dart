import 'dart:convert';

import '../models/recenzija.dart';
import 'base_provider.dart';

class RecenzijaProvider extends BaseProvider<Recenzija> {
  RecenzijaProvider() : super("Recenzija");

  @override
  Recenzija fromJson(data) {
    return Recenzija.fromJson(data);
  }

  Future<dynamic> dodajRecenziju(Map<dynamic, dynamic> recenzija) async {
    var url = "$fullUrl";
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    var response =
        await http!.post(uri, headers: headers, body: jsonEncode(recenzija));
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);

      return (data["errors"]["ERROR"].toString());
    } else if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Recenzija recenzija = fromJson(data);
      return recenzija;
    } else {
      throw Exception("Wrong username or password");
    }
  }
}
