// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationNotifier _$ReservationNotifierFromJson(Map<String, dynamic> json) =>
    ReservationNotifier(
      json['trening'] as String?,
      json['email'] as String?,
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
      json['vrijeme'] == null
          ? null
          : DateTime.parse(json['vrijeme'] as String),
    );

Map<String, dynamic> _$ReservationNotifierToJson(
        ReservationNotifier instance) =>
    <String, dynamic>{
      'trening': instance.trening,
      'email': instance.email,
      'datum': instance.datum?.toIso8601String(),
      'vrijeme': instance.vrijeme?.toIso8601String(),
    };
