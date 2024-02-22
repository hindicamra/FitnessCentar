import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? korisnikId;
  String? ime;
  String? prezime;
  String? korisnickoIme;
  String? email;
  String? telefon;
  String? adresa;
  String? status;
  int? ulogaId;
  String? planIshrane;

  UserModel(
    this.korisnikId,
    this.ime,
    this.prezime,
    this.korisnickoIme,
    this.email,
    this.telefon,
    this.adresa,
    this.status,
    this.ulogaId,
    this.planIshrane,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
