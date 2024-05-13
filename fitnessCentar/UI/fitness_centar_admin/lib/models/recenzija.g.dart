// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recenzija.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recenzija _$RecenzijaFromJson(Map<String, dynamic> json) => Recenzija(
      (json['recenzijaId'] as num?)?.toInt(),
      json['korisnik'] as String?,
      (json['treningId'] as num?)?.toInt(),
      json['tekst'] as String?,
      (json['ocjena'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RecenzijaToJson(Recenzija instance) => <String, dynamic>{
      'recenzijaId': instance.recenzijaId,
      'korisnik': instance.korisnik,
      'treningId': instance.treningId,
      'tekst': instance.tekst,
      'ocjena': instance.ocjena,
    };
