// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trening.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trening _$TreningFromJson(Map<String, dynamic> json) => Trening(
      (json['treningId'] as num?)?.toInt(),
      json['naziv'] as String?,
      json['opis'] as String?,
    );

Map<String, dynamic> _$TreningToJson(Trening instance) => <String, dynamic>{
      'treningId': instance.treningId,
      'naziv': instance.naziv,
      'opis': instance.opis,
    };
