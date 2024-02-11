import 'package:json_annotation/json_annotation.dart';

part 'training_model.g.dart';

@JsonSerializable()
class TrainingModel {
  final int trainingId;
  final String date;
  final int duration;
  final String trainer;
  final String typeOfTraining;
  TrainingModel(
    this.trainingId,
    this.date,
    this.duration,
    this.trainer,
    this.typeOfTraining,
  );
  factory TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingModelToJson(this);
}
