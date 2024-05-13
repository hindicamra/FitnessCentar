// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rezervacija.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rezervacija _$RezervacijaFromJson(Map<dynamic, dynamic> json) => Rezervacija(
      (json['rezervacijaId'] as num?)?.toInt(),
      (json['treningId'] as num?)?.toInt(),
      json['korisnik'] as String?,
      json['datum'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$RezervacijaToJson(Rezervacija instance) =>
    <String, dynamic>{
      'rezervacijaId': instance.rezervacijaId,
      'treningId': instance.treningId,
      'korisnik': instance.korisnik,
      'datum': instance.datum,
      'status': instance.status,
    };
