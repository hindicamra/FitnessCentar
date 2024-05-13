import 'dart:convert';

import '../models/tip_clanarina.dart';
import 'base_provider.dart';

class TipClanarineProvider extends BaseProvider<TipClanarina> {
  TipClanarineProvider() : super("TipClanarine");

  @override
  TipClanarina fromJson(data) {
    return TipClanarina.fromJson(data);
  }

  Future<TipClanarina> updateTipClanarine(
      Map<dynamic, dynamic> tipClanarine, int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(tipClanarine);
    var headers = createHeaders();
    var response = await http!.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      TipClanarina list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
