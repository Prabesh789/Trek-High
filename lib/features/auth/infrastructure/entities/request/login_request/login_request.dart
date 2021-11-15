import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    // required int platform,
    required String deviceId,
    double? latitude,
    double? longitude,
  }) = _LoginRequest;
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
