// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'korisnik.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Korsnik _$KorsnikFromJson(Map<String, dynamic> json) => Korsnik(
      json['korisnikId'] as int?,
      json['ime'] as String?,
      json['prezime'] as String?,
      json['korisnickoIme'] as String?,
      json['email'] as String?,
      json['telefon'] as String?,
      json['adresa'] as String?,
      json['status'] as String?,
      json['ulogaId'] as int?,
    );

Map<String, dynamic> _$KorsnikToJson(Korsnik instance) => <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'ime': instance.ime,
      'prezime': instance.prezime,
      'korisnickoIme': instance.korisnickoIme,
      'email': instance.email,
      'telefon': instance.telefon,
      'adresa': instance.adresa,
      'status': instance.status,
      'ulogaId': instance.ulogaId,
    };
