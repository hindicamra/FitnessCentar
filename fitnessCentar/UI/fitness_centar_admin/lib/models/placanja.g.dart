// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placanja.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Placanja _$PlacanjaFromJson(Map<String, dynamic> json) => Placanja(
      (json['placanjeId'] as num?)?.toInt(),
      (json['iznos'] as num?)?.toInt(),
      (json['tipClanarine'] as num?)?.toInt(),
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
    );

Map<String, dynamic> _$PlacanjaToJson(Placanja instance) => <String, dynamic>{
      'placanjeId': instance.placanjeId,
      'iznos': instance.iznos,
      'tipClanarine': instance.tipClanarine,
      'datum': instance.datum?.toIso8601String(),
    };
