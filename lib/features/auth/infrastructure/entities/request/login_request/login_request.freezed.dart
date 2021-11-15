// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
class _$LoginRequestTearOff {
  const _$LoginRequestTearOff();

  _LoginRequest call(
      {required String email,
      required String password,
      required String deviceId,
      double? latitude,
      double? longitude}) {
    return _LoginRequest(
      email: email,
      password: password,
      deviceId: deviceId,
      latitude: latitude,
      longitude: longitude,
    );
  }

  LoginRequest fromJson(Map<String, Object> json) {
    return LoginRequest.fromJson(json);
  }
}

/// @nodoc
const $LoginRequest = _$LoginRequestTearOff();

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password =>
      throw _privateConstructorUsedError; // required int platform,
  String get deviceId => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      String deviceId,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res> implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  final LoginRequest _value;
  // ignore: unused_field
  final $Res Function(LoginRequest) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? deviceId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$LoginRequestCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(
          _LoginRequest value, $Res Function(_LoginRequest) then) =
      __$LoginRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      String deviceId,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$LoginRequestCopyWithImpl<$Res> extends _$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(
      _LoginRequest _value, $Res Function(_LoginRequest) _then)
      : super(_value, (v) => _then(v as _LoginRequest));

  @override
  _LoginRequest get _value => super._value as _LoginRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? deviceId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_LoginRequest(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_LoginRequest implements _LoginRequest {
  const _$_LoginRequest(
      {required this.email,
      required this.password,
      required this.deviceId,
      this.latitude,
      this.longitude});

  factory _$_LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override // required int platform,
  final String deviceId;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password, deviceId: $deviceId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
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
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @JsonKey(ignore: true)
  @override
  _$LoginRequestCopyWith<_LoginRequest> get copyWith =>
      __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginRequestToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required String email,
      required String password,
      required String deviceId,
      double? latitude,
      double? longitude}) = _$_LoginRequest;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginRequest.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override // required int platform,
  String get deviceId => throw _privateConstructorUsedError;
  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginRequestCopyWith<_LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
