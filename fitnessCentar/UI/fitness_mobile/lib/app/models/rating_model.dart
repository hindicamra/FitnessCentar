import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final int id;
  final int rating;
  final String comment;
  RatingModel(
    this.id,
    this.rating,
    this.comment,
  );
  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
