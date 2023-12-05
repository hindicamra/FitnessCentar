import 'package:fitnesscentar_admin/models/korisnik.dart';
import 'package:fitnesscentar_admin/providers/base_provider.dart';

class KorisnikProvider extends BaseProvider<Korisnik> {
  KorisnikProvider(): super("Korisnik");

  @override
  Korisnik fromJson(date){
    return Korisnik.fromJson(date);
  }
}