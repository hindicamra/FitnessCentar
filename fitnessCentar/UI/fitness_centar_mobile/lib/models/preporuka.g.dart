// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preporuka.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preporuka _$PreporukaFromJson(Map<String, dynamic> json) => Preporuka(
      json['korisnik'] as String?,
      json['trening'] == null
          ? null
          : Trening.fromJson(json['trening'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreporukaToJson(Preporuka instance) => <String, dynamic>{
      'korisnik': instance.korisnik,
      'trening': instance.trening,
    };
