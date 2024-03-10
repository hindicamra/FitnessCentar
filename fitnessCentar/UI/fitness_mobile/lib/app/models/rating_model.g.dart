// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      json['id'] as int,
      json['rating'] as int,
      json['comment'] as String,
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
    };
