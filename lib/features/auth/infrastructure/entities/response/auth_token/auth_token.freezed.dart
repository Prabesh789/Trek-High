// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return _AuthToken.fromJson(json);
}

/// @nodoc
class _$AuthTokenTearOff {
  const _$AuthTokenTearOff();

  _AuthToken call(
      {@HiveField(0) String? authToken, @HiveField(1) String? fcmToken}) {
    return _AuthToken(
      authToken: authToken,
      fcmToken: fcmToken,
    );
  }

  AuthToken fromJson(Map<String, Object> json) {
    return AuthToken.fromJson(json);
  }
}

/// @nodoc
const $AuthToken = _$AuthTokenTearOff();

/// @nodoc
mixin _$AuthToken {
  @HiveField(0)
  String? get authToken => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenCopyWith<AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenCopyWith<$Res> {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) then) =
      _$AuthTokenCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String? authToken, @HiveField(1) String? fcmToken});
}

/// @nodoc
class _$AuthTokenCopyWithImpl<$Res> implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._value, this._then);

  final AuthToken _value;
  // ignore: unused_field
  final $Res Function(AuthToken) _then;

  @override
  $Res call({
    Object? authToken = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthTokenCopyWith<$Res> implements $AuthTokenCopyWith<$Res> {
  factory _$AuthTokenCopyWith(
          _AuthToken value, $Res Function(_AuthToken) then) =
      __$AuthTokenCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String? authToken, @HiveField(1) String? fcmToken});
}

/// @nodoc
class __$AuthTokenCopyWithImpl<$Res> extends _$AuthTokenCopyWithImpl<$Res>
    implements _$AuthTokenCopyWith<$Res> {
  __$AuthTokenCopyWithImpl(_AuthToken _value, $Res Function(_AuthToken) _then)
      : super(_value, (v) => _then(v as _AuthToken));

  @override
  _AuthToken get _value => super._value as _AuthToken;

  @override
  $Res call({
    Object? authToken = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_AuthToken(
      authToken: authToken == freezed
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthToken implements _AuthToken {
  const _$_AuthToken(
      {@HiveField(0) this.authToken, @HiveField(1) this.fcmToken});

  factory _$_AuthToken.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthTokenFromJson(json);

  @override
  @HiveField(0)
  final String? authToken;
  @override
  @HiveField(1)
  final String? fcmToken;

  @override
  String toString() {
    return 'AuthToken(authToken: $authToken, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthToken &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.fcmToken, fcmToken) ||
                const DeepCollectionEquality()
                    .equals(other.fcmToken, fcmToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authToken) ^
      const DeepCollectionEquality().hash(fcmToken);

  @JsonKey(ignore: true)
  @override
  _$AuthTokenCopyWith<_AuthToken> get copyWith =>
      __$AuthTokenCopyWithImpl<_AuthToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthTokenToJson(this);
  }
}

abstract class _AuthToken implements AuthToken {
  const factory _AuthToken(
      {@HiveField(0) String? authToken,
      @HiveField(1) String? fcmToken}) = _$_AuthToken;

  factory _AuthToken.fromJson(Map<String, dynamic> json) =
      _$_AuthToken.fromJson;

  @override
  @HiveField(0)
  String? get authToken => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get fcmToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthTokenCopyWith<_AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}
