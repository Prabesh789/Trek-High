import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required String userId,
    required String fullName,
    required String contact,
    required String address,
    required String email,
    // required String password,
    // required String image,
    // String? aboutYou,
    int? platform,
    String? deviceId,
  }) = _UserResponse;
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
