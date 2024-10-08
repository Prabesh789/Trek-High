// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthTokenAdapter extends TypeAdapter<AuthToken> {
  @override
  final int typeId = 0;

  @override
  AuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthToken(
      authToken: fields[0] as String?,
      fcmToken: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthToken obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.authToken)
      ..writeByte(1)
      ..write(obj.fcmToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthToken _$_$_AuthTokenFromJson(Map<String, dynamic> json) {
  return _$_AuthToken(
    authToken: json['authToken'] as String?,
    fcmToken: json['fcmToken'] as String?,
  );
}

Map<String, dynamic> _$_$_AuthTokenToJson(_$_AuthToken instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'fcmToken': instance.fcmToken,
    };
