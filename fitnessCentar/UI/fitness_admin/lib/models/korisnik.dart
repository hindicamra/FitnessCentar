import 'package:json_annotation/json_annotation.dart';

part 'korisnik.g.dart';

@JsonSerializable()
class Korisnik {
  int? korisnikId;
  String? ime;
  String? prezime;
  String? korisnickoIme;
  String? email;
  String? telefon;
  String? adresa;
  String? status;
  int? ulogaId;

  Korisnik(
    this.korisnikId,
    this.ime,
    this.prezime,
    this.korisnickoIme,
    this.email,
    this.telefon,
    this.adresa,
    this.status,
    this.ulogaId
  );

  factory Korisnik.fromJson(Map<String, dynamic> json) => _$KorisnikFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$KorisnikToJson(this);
}