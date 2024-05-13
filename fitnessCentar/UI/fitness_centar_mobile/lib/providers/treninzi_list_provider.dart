import 'package:fitness_centar_mobile/models/trening.dart';
import 'base_provider.dart';

class TreninziListProvider extends BaseProvider<Trening> {
  TreninziListProvider() : super("Trening");

  @override
  Trening fromJson(data) {
    return Trening.fromJson(data);
  }
}
