import 'package:fitness_centar_mobile/models/tip_clanarina.dart';

import 'base_provider.dart';

class TipClanarineProvider extends BaseProvider<TipClanarina> {
  TipClanarineProvider() : super("TipClanarine");

  @override
  TipClanarina fromJson(data) {
    return TipClanarina.fromJson(data);
  }
}
