import 'package:fitness_centar_mobile/models/plan_ishrane.dart';
import 'base_provider.dart';

class PlanIshraneProvider extends BaseProvider<PlanIshrane> {
  PlanIshraneProvider() : super("PlanIshrane");

  @override
  PlanIshrane fromJson(data) {
    return PlanIshrane.fromJson(data);
  }
}
