// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_plan_ishrane.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListaPlanIshrane _$ListaPlanIshraneFromJson(Map<String, dynamic> json) =>
    ListaPlanIshrane(
      (json['planoviIshrane'] as List<dynamic>?)
          ?.map((e) => PlanIshrane.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListaPlanIshraneToJson(ListaPlanIshrane instance) =>
    <String, dynamic>{
      'planoviIshrane': instance.planoviIshrane,
    };
