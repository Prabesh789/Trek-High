// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_signup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewSignupRequest _$NewSignupRequestFromJson(Map<String, dynamic> json) {
  return _NewSignupRequest.fromJson(json);
}

/// @nodoc
class _$NewSignupRequestTearOff {
  const _$NewSignupRequestTearOff();

  _NewSignupRequest call(
      {required String fullName,
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
      double? longitude}) {
    return _NewSignupRequest(
      fullName: fullName,
      email: email,
      emailVerified: emailVerified,
      contact: contact,
      address: address,
      fcmToken: fcmToken,
      platform: platform,
      deviceId: deviceId,
      image: image,
      dob: dob,
      gender: gender,
      latitude: latitude,
      longitude: longitude,
    );
  }

  NewSignupRequest fromJson(Map<String, Object> json) {
    return NewSignupRequest.fromJson(json);
  }
}

/// @nodoc
const $NewSignupRequest = _$NewSignupRequestTearOff();

/// @nodoc
mixin _$NewSignupRequest {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  int get platform => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewSignupRequestCopyWith<NewSignupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewSignupRequestCopyWith<$Res> {
  factory $NewSignupRequestCopyWith(
          NewSignupRequest value, $Res Function(NewSignupRequest) then) =
      _$NewSignupRequestCopyWithImpl<$Res>;
  $Res call(
      {String fullName,
      String email,
      bool emailVerified,
      String contact,
      String address,
      String fcmToken,
      int platform,
      String deviceId,
      String? image,
      String? dob,
      String? gender,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$NewSignupRequestCopyWithImpl<$Res>
    implements $NewSignupRequestCopyWith<$Res> {
  _$NewSignupRequestCopyWithImpl(this._value, this._then);

  final NewSignupRequest _value;
  // ignore: unused_field
  final $Res Function(NewSignupRequest) _then;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? contact = freezed,
    Object? address = freezed,
    Object? fcmToken = freezed,
    Object? platform = freezed,
    Object? deviceId = freezed,
    Object? image = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$NewSignupRequestCopyWith<$Res>
    implements $NewSignupRequestCopyWith<$Res> {
  factory _$NewSignupRequestCopyWith(
          _NewSignupRequest value, $Res Function(_NewSignupRequest) then) =
      __$NewSignupRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String fullName,
      String email,
      bool emailVerified,
      String contact,
      String address,
      String fcmToken,
      int platform,
      String deviceId,
      String? image,
      String? dob,
      String? gender,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$NewSignupRequestCopyWithImpl<$Res>
    extends _$NewSignupRequestCopyWithImpl<$Res>
    implements _$NewSignupRequestCopyWith<$Res> {
  __$NewSignupRequestCopyWithImpl(
      _NewSignupRequest _value, $Res Function(_NewSignupRequest) _then)
      : super(_value, (v) => _then(v as _NewSignupRequest));

  @override
  _NewSignupRequest get _value => super._value as _NewSignupRequest;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? contact = freezed,
    Object? address = freezed,
    Object? fcmToken = freezed,
    Object? platform = freezed,
    Object? deviceId = freezed,
    Object? image = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_NewSignupRequest(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewSignupRequest implements _NewSignupRequest {
  const _$_NewSignupRequest(
      {required this.fullName,
      required this.email,
      required this.emailVerified,
      required this.contact,
      required this.address,
      required this.fcmToken,
      required this.platform,
      required this.deviceId,
      this.image,
      this.dob,
      this.gender,
      this.latitude,
      this.longitude});

  factory _$_NewSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_NewSignupRequestFromJson(json);

  @override
  final String fullName;
  @override
  final String email;
  @override
  final bool emailVerified;
  @override
  final String contact;
  @override
  final String address;
  @override
  final String fcmToken;
  @override
  final int platform;
  @override
  final String deviceId;
  @override
  final String? image;
  @override
  final String? dob;
  @override
  final String? gender;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'NewSignupRequest(fullName: $fullName, email: $email, emailVerified: $emailVerified, contact: $contact, address: $address, fcmToken: $fcmToken, platform: $platform, deviceId: $deviceId, image: $image, dob: $dob, gender: $gender, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewSignupRequest &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.dob, dob) ||
                const DeepCollectionEquality().equals(other.dob, dob)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(fcmToken) ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(dob) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @JsonKey(ignore: true)
  @override
  _$NewSignupRequestCopyWith<_NewSignupRequest> get copyWith =>
      __$NewSignupRequestCopyWithImpl<_NewSignupRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewSignupRequestToJson(this);
  }
}

abstract class _NewSignupRequest implements NewSignupRequest {
  const factory _NewSignupRequest(
      {required String fullName,
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
      double? longitude}) = _$_NewSignupRequest;

  factory _NewSignupRequest.fromJson(Map<String, dynamic> json) =
      _$_NewSignupRequest.fromJson;

  @override
  String get fullName => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  bool get emailVerified => throw _privateConstructorUsedError;
  @override
  String get contact => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get fcmToken => throw _privateConstructorUsedError;
  @override
  int get platform => throw _privateConstructorUsedError;
  @override
  String get deviceId => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get dob => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewSignupRequestCopyWith<_NewSignupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
