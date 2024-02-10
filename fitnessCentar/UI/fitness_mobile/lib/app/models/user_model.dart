import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String surname;
  final int age;
  final int height;
  final int weight;
  UserModel(this.name, this.surname, this.age, this.height, this.weight);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
