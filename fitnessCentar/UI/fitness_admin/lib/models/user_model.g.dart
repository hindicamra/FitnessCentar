// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['korisnikId'] as int?,
      json['ime'] as String?,
      json['prezime'] as String?,
      json['korisnickoIme'] as String?,
      json['email'] as String?,
      json['telefon'] as String?,
      json['adresa'] as String?,
      json['status'] as int?,
      json['ulogaId'] as int?,
      json['planIshrane'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'ime': instance.ime,
      'prezime': instance.prezime,
      'korisnickoIme': instance.korisnickoIme,
      'email': instance.email,
      'telefon': instance.telefon,
      'adresa': instance.adresa,
      'status': instance.status,
      'ulogaId': instance.ulogaId,
      'planIshrane': instance.planIshrane,
    };
