// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_signup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return _SignupResponse.fromJson(json);
}

/// @nodoc
class _$SignupResponseTearOff {
  const _$SignupResponseTearOff();

  _SignupResponse call(
      {required String email,
      required String firstName,
      required String message}) {
    return _SignupResponse(
      email: email,
      firstName: firstName,
      message: message,
    );
  }

  SignupResponse fromJson(Map<String, Object> json) {
    return SignupResponse.fromJson(json);
  }
}

/// @nodoc
const $SignupResponse = _$SignupResponseTearOff();

/// @nodoc
mixin _$SignupResponse {
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupResponseCopyWith<SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseCopyWith<$Res> {
  factory $SignupResponseCopyWith(
          SignupResponse value, $Res Function(SignupResponse) then) =
      _$SignupResponseCopyWithImpl<$Res>;
  $Res call({String email, String firstName, String message});
}

/// @nodoc
class _$SignupResponseCopyWithImpl<$Res>
    implements $SignupResponseCopyWith<$Res> {
  _$SignupResponseCopyWithImpl(this._value, this._then);

  final SignupResponse _value;
  // ignore: unused_field
  final $Res Function(SignupResponse) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignupResponseCopyWith<$Res>
    implements $SignupResponseCopyWith<$Res> {
  factory _$SignupResponseCopyWith(
          _SignupResponse value, $Res Function(_SignupResponse) then) =
      __$SignupResponseCopyWithImpl<$Res>;
  @override
  $Res call({String email, String firstName, String message});
}

/// @nodoc
class __$SignupResponseCopyWithImpl<$Res>
    extends _$SignupResponseCopyWithImpl<$Res>
    implements _$SignupResponseCopyWith<$Res> {
  __$SignupResponseCopyWithImpl(
      _SignupResponse _value, $Res Function(_SignupResponse) _then)
      : super(_value, (v) => _then(v as _SignupResponse));

  @override
  _SignupResponse get _value => super._value as _SignupResponse;

  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? message = freezed,
  }) {
    return _then(_SignupResponse(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignupResponse implements _SignupResponse {
  const _$_SignupResponse(
      {required this.email, required this.firstName, required this.message});

  factory _$_SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SignupResponseFromJson(json);

  @override
  final String email;
  @override
  final String firstName;
  @override
  final String message;

  @override
  String toString() {
    return 'SignupResponse(email: $email, firstName: $firstName, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignupResponse &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SignupResponseCopyWith<_SignupResponse> get copyWith =>
      __$SignupResponseCopyWithImpl<_SignupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignupResponseToJson(this);
  }
}

abstract class _SignupResponse implements SignupResponse {
  const factory _SignupResponse(
      {required String email,
      required String firstName,
      required String message}) = _$_SignupResponse;

  factory _SignupResponse.fromJson(Map<String, dynamic> json) =
      _$_SignupResponse.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignupResponseCopyWith<_SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
