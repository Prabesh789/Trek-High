// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewSignupRequest _$_$_NewSignupRequestFromJson(Map<String, dynamic> json) {
  return _$_NewSignupRequest(
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    emailVerified: json['emailVerified'] as bool,
    contact: json['contact'] as String,
    address: json['address'] as String,
    deviceId: json['deviceId'] as String,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_NewSignupRequestToJson(
        _$_NewSignupRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'contact': instance.contact,
      'address': instance.address,
      'deviceId': instance.deviceId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
