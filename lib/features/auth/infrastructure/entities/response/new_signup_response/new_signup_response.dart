import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_signup_response.freezed.dart';
part 'new_signup_response.g.dart';

@freezed
class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required String email,
    required String firstName,
    required String message,
  }) = _SignupResponse;
  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
