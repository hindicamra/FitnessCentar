// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'izvjestaj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Izvjestaj _$IzvjestajFromJson(Map<String, dynamic> json) => Izvjestaj(
      (json['aktivni'] as num?)?.toInt(),
      (json['neAktivni'] as num?)?.toInt(),
      (json['ukupno'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IzvjestajToJson(Izvjestaj instance) => <String, dynamic>{
      'aktivni': instance.aktivni,
      'neAktivni': instance.neAktivni,
      'ukupno': instance.ukupno,
    };
