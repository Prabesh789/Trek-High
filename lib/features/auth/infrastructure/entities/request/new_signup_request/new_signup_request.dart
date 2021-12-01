import 'dart:io';

class NewSignupRequest {
  NewSignupRequest({
    this.image,
    required this.fullName,
    required this.email,
    required this.contact,
    required this.address,
    required this.deviceId,
    this.latitude,
    this.longitude,
    required this.password,
    required this.platform,
    this.aboutYou,
  });
  final File? image;
  final String fullName;
  final String email;
  final String contact;
  final String address;
  final String deviceId;
  final double? latitude;
  final double? longitude;
  final String password;
  final int platform;
  final String? aboutYou;
}
