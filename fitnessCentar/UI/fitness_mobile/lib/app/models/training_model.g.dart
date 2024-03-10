// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) =>
    TrainingModel(
      json['trainingId'] as int,
      json['date'] as String,
      json['duration'] as int,
      json['trainer'] as String,
      json['typeOfTraining'] as String,
      json['price'] as int,
    );

Map<String, dynamic> _$TrainingModelToJson(TrainingModel instance) =>
    <String, dynamic>{
      'trainingId': instance.trainingId,
      'date': instance.date,
      'duration': instance.duration,
      'trainer': instance.trainer,
      'typeOfTraining': instance.typeOfTraining,
      'price': instance.price,
    };
