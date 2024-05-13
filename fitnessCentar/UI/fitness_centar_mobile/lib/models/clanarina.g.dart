// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clanarina.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clanarina _$ClanarinaFromJson(Map<String, dynamic> json) => Clanarina(
      (json['clanarinaId'] as num?)?.toInt(),
      (json['tipClanarineId'] as num?)?.toInt(),
      (json['korisnikId'] as num?)?.toInt(),
      json['korisnik'] as String?,
      json['tipClanarine'] as String?,
      json['vaziDo'] as String?,
    );

Map<String, dynamic> _$ClanarinaToJson(Clanarina instance) => <String, dynamic>{
      'clanarinaId': instance.clanarinaId,
      'tipClanarineId': instance.tipClanarineId,
      'korisnikId': instance.korisnikId,
      'korisnik': instance.korisnik,
      'tipClanarine': instance.tipClanarine,
      'vaziDo': instance.vaziDo,
    };
