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
    required String fcmToken,
    required int platform,
    required String deviceId,
    String? image,
    String? dob,
    String? gender,
    double? latitude,
    double? longitude,
  }) = _NewSignupRequest;
  factory NewSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$NewSignupRequestFromJson(json);
}
