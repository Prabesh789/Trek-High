// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$_$_UserResponseFromJson(Map<String, dynamic> json) {
  return _$_UserResponse(
    userId: json['userId'] as String,
    fullName: json['fullName'] as String,
    contact: json['contact'] as String,
    address: json['address'] as String,
    email: json['email'] as String,
    platform: json['platform'] as int?,
    deviceId: json['deviceId'] as String?,
  );
}

Map<String, dynamic> _$_$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'contact': instance.contact,
      'address': instance.address,
      'email': instance.email,
      'platform': instance.platform,
      'deviceId': instance.deviceId,
    };
