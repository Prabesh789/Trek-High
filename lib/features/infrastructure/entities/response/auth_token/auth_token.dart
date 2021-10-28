import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trek_high/app_setup/local_database/hive/hive_const.dart';
part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
@HiveType(typeId: hiveTokenBoxId)
class AuthToken with _$AuthToken {
  const factory AuthToken({
    @HiveField(0) String? authToken,
    @HiveField(1) String? fcmToken,
  }) = _AuthToken;
  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}
