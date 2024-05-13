// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'izvjestaj_rezervacije.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IzvjestajRezervacije _$IzvjestajRezervacijeFromJson(
        Map<String, dynamic> json) =>
    IzvjestajRezervacije(
      (json['naCekanju'] as num?)?.toInt(),
      (json['odobreno'] as num?)?.toInt(),
      (json['odbijeno'] as num?)?.toInt(),
      (json['ukupno'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IzvjestajRezervacijeToJson(
        IzvjestajRezervacije instance) =>
    <String, dynamic>{
      'naCekanju': instance.naCekanju,
      'odobreno': instance.odobreno,
      'odbijeno': instance.odbijeno,
      'ukupno': instance.ukupno,
    };
