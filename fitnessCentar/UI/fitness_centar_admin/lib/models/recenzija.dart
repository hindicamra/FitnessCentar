import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'recenzija.g.dart';

@JsonSerializable()
class Recenzija {
  int? recenzijaId;
  String? korisnik;
  int? treningId;
  String? tekst;
  int? ocjena;
  Recenzija(
      this.recenzijaId, this.korisnik, this.treningId, this.tekst, this.ocjena);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Recenzija.fromJson(Map<String, dynamic> json) =>
      _$RecenzijaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RecenzijaToJson(this);
}
