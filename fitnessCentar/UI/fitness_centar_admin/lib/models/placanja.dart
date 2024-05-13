import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'placanja.g.dart';

@JsonSerializable()
class Placanja {
  int? placanjeId;
  int? iznos;
  int? tipClanarine;
  DateTime? datum;

  Placanja(this.placanjeId, this.iznos, this.tipClanarine, this.datum);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Placanja.fromJson(Map<String, dynamic> json) =>
      _$PlacanjaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PlacanjaToJson(this);
}
