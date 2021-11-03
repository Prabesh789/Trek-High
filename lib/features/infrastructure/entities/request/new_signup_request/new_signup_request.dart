// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'new_signup_request.freezed.dart';
// part 'new_signup_request.g.dart';

// @freezed
// class NewSignupRequest with _$NewSignupRequest {
//   const factory NewSignupRequest({
//     required String fullName,
//     required String email,
//     required bool emailVerified,
//     required String contact,
//     required String address,
//     required String deviceId,
//     dynamic image,
//     double? latitude,
//     double? longitude,
//   }) = _NewSignupRequest;
//   factory NewSignupRequest.fromJson(Map<String, dynamic> json) =>
//       _$NewSignupRequestFromJson(json);
// }

import 'dart:io';

class NewSignupRequest {
  NewSignupRequest(
      {this.image,
      required this.fullName,
      required this.email,
      required this.contact,
      required this.address,
      required this.emailVerified,
      required this.deviceId,
      this.latitude,
      this.longitude,
      required this.password});
  final File? image;
  final String fullName;
  final String email;
  final String contact;
  final String address;
  final bool emailVerified;
  final String deviceId;
  final double? latitude;
  final double? longitude;
  final String password;
}
