import 'dart:convert';
import '../models/plan_ishrane.dart';
import 'base_provider.dart';

class PlanIshraneProvider extends BaseProvider<PlanIshrane> {
  PlanIshraneProvider() : super("PlanIshrane");

  @override
  PlanIshrane fromJson(data) {
    return PlanIshrane.fromJson(data);
  }

  Future<PlanIshrane> updatePlanIshrane(
      Map<dynamic, dynamic> planIshrane, int id) async {
    var url = "$fullUrl/$id";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(planIshrane);
    var headers = createHeaders();
    var response = await http!.put(uri, headers: headers, body: jsonRequest);

    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      PlanIshrane list = fromJson(data);

      return list;
    } else {
      throw Exception("Error");
    }
  }
}
