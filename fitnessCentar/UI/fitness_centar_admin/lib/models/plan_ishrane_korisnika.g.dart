// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_ishrane_korisnika.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanIshraneKorisnika _$PlanIshraneKorisnikaFromJson(
        Map<String, dynamic> json) =>
    PlanIshraneKorisnika(
      (json['planIshraneKorisnikaId'] as num?)?.toInt(),
      json['planIshraneKorisnika'] as String?,
      json['korisnik'] as String?,
    );

Map<String, dynamic> _$PlanIshraneKorisnikaToJson(
        PlanIshraneKorisnika instance) =>
    <String, dynamic>{
      'planIshraneKorisnikaId': instance.planIshraneKorisnikaId,
      'planIshraneKorisnika': instance.planIshraneKorisnika,
      'korisnik': instance.korisnik,
    };
