// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRequest _$_$_LoginRequestFromJson(Map<String, dynamic> json) {
  return _$_LoginRequest(
    email: json['email'] as String,
    password: json['password'] as String,
    platform: json['platform'] as int?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'platform': instance.platform,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
