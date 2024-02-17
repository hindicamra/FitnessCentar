import 'package:fitness_mobile/app/models/training_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? userId;
  final String name;
  final String surname;
  final String email;
  final int? age;
  final int? height;
  final int? weight;
  final List<TrainingModel>? listOfActiveTrainings;
  UserModel(
    this.userId,
    this.name,
    this.surname,
    this.email,
    this.age,
    this.height,
    this.weight,
    this.listOfActiveTrainings,
  );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
