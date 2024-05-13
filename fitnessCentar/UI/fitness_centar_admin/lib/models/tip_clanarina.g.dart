// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_clanarina.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipClanarina _$TipClanarinaFromJson(Map<String, dynamic> json) => TipClanarina(
      (json['tipClanarineId'] as num?)?.toInt(),
      json['naziv'] as String?,
      (json['cijena'] as num?)?.toDouble(),
      (json['trajanje'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TipClanarinaToJson(TipClanarina instance) =>
    <String, dynamic>{
      'tipClanarineId': instance.tipClanarineId,
      'naziv': instance.naziv,
      'cijena': instance.cijena,
      'trajanje': instance.trajanje,
    };
