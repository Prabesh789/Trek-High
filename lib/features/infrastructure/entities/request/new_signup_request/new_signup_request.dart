import 'dart:html';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_signup_request.freezed.dart';
part 'new_signup_request.g.dart';

@freezed
class NewSignupRequest with _$NewSignupRequest {
  const factory NewSignupRequest({
    required String fullName,
    required String email,
    required bool emailVerified,
    required String contact,
    required String address,
    required String deviceId,
    // File? image,
    double? latitude,
    double? longitude,
  }) = _NewSignupRequest;
  factory NewSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$NewSignupRequestFromJson(json);
}
