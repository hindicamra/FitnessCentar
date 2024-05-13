import '../models/clanarina.dart';
import 'base_provider.dart';

class ClanarinaProvider extends BaseProvider<Clanarina> {
  ClanarinaProvider() : super("Clanarina");

  @override
  Clanarina fromJson(data) {
    return Clanarina.fromJson(data);
  }
}
