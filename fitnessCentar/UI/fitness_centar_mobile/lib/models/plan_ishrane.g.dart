// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_ishrane.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanIshrane _$PlanIshraneFromJson(Map<String, dynamic> json) => PlanIshrane(
      (json['planIshraneId'] as num?)?.toInt(),
      json['naziv'] as String?,
      json['opis'] as String?,
    );

Map<String, dynamic> _$PlanIshraneToJson(PlanIshrane instance) =>
    <String, dynamic>{
      'planIshraneId': instance.planIshraneId,
      'naziv': instance.naziv,
      'opis': instance.opis,
    };
