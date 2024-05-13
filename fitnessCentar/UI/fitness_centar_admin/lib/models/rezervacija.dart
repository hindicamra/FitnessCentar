import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'rezervacija.g.dart';

@JsonSerializable()
class Rezervacija {
  int? rezervacijaId;
  int? treningId;
  String? korisnik;
  String? datum;
  String? status;

  Rezervacija(this.rezervacijaId, this.treningId, this.korisnik, this.datum,
      this.status);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Rezervacija.fromJson(Map<dynamic, dynamic> json) =>
      _$RezervacijaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<dynamic, dynamic> toJson() => _$RezervacijaToJson(this);
}
