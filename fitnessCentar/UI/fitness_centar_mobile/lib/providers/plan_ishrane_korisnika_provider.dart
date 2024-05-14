import 'dart:convert';

import '../models/plan_ishrane_korisnika.dart';
import 'base_provider.dart';

class PlanIshraneKorisnikaProvider extends BaseProvider<PlanIshraneKorisnika> {
  PlanIshraneKorisnikaProvider() : super("PlanIshraneKorisnik");

  @override
  PlanIshraneKorisnika fromJson(data) {
    return PlanIshraneKorisnika.fromJson(data);
  }

  Future<PlanIshraneKorisnika> updatePlanIshrane(
      Map<dynamic, dynamic> planIshrane, int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(planIshrane);
    var headers = createHeaders();
    var response = await http!.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      PlanIshraneKorisnika list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }

  Future<PlanIshraneKorisnika> getPlanIshrane(int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http!.get(
      uri,
      headers: headers,
    );

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      PlanIshraneKorisnika list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
