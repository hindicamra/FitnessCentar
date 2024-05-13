// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preporuka.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preporuka _$PreporukaFromJson(Map<String, dynamic> json) => Preporuka(
      json['korisnik'] as String?,
      (json['treningId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PreporukaToJson(Preporuka instance) => <String, dynamic>{
      'korisnik': instance.korisnik,
      'treningId': instance.treningId,
    };
