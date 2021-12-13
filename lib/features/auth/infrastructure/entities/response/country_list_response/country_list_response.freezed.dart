// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryListResponse _$CountryListResponseFromJson(Map<String, dynamic> json) {
  return _CountryListResponse.fromJson(json);
}

/// @nodoc
class _$CountryListResponseTearOff {
  const _$CountryListResponseTearOff();

  _CountryListResponse call(
      {required bool error,
      required String msg,
      required List<NameResponseData> data}) {
    return _CountryListResponse(
      error: error,
      msg: msg,
      data: data,
    );
  }

  CountryListResponse fromJson(Map<String, Object> json) {
    return CountryListResponse.fromJson(json);
  }
}

/// @nodoc
const $CountryListResponse = _$CountryListResponseTearOff();

/// @nodoc
mixin _$CountryListResponse {
  bool get error => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  List<NameResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryListResponseCopyWith<CountryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryListResponseCopyWith<$Res> {
  factory $CountryListResponseCopyWith(
          CountryListResponse value, $Res Function(CountryListResponse) then) =
      _$CountryListResponseCopyWithImpl<$Res>;
  $Res call({bool error, String msg, List<NameResponseData> data});
}

/// @nodoc
class _$CountryListResponseCopyWithImpl<$Res>
    implements $CountryListResponseCopyWith<$Res> {
  _$CountryListResponseCopyWithImpl(this._value, this._then);

  final CountryListResponse _value;
  // ignore: unused_field
  final $Res Function(CountryListResponse) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NameResponseData>,
    ));
  }
}

/// @nodoc
abstract class _$CountryListResponseCopyWith<$Res>
    implements $CountryListResponseCopyWith<$Res> {
  factory _$CountryListResponseCopyWith(_CountryListResponse value,
          $Res Function(_CountryListResponse) then) =
      __$CountryListResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool error, String msg, List<NameResponseData> data});
}

/// @nodoc
class __$CountryListResponseCopyWithImpl<$Res>
    extends _$CountryListResponseCopyWithImpl<$Res>
    implements _$CountryListResponseCopyWith<$Res> {
  __$CountryListResponseCopyWithImpl(
      _CountryListResponse _value, $Res Function(_CountryListResponse) _then)
      : super(_value, (v) => _then(v as _CountryListResponse));

  @override
  _CountryListResponse get _value => super._value as _CountryListResponse;

  @override
  $Res call({
    Object? error = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_CountryListResponse(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NameResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryListResponse implements _CountryListResponse {
  const _$_CountryListResponse(
      {required this.error, required this.msg, required this.data});

  factory _$_CountryListResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryListResponseFromJson(json);

  @override
  final bool error;
  @override
  final String msg;
  @override
  final List<NameResponseData> data;

  @override
  String toString() {
    return 'CountryListResponse(error: $error, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryListResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$CountryListResponseCopyWith<_CountryListResponse> get copyWith =>
      __$CountryListResponseCopyWithImpl<_CountryListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryListResponseToJson(this);
  }
}

abstract class _CountryListResponse implements CountryListResponse {
  const factory _CountryListResponse(
      {required bool error,
      required String msg,
      required List<NameResponseData> data}) = _$_CountryListResponse;

  factory _CountryListResponse.fromJson(Map<String, dynamic> json) =
      _$_CountryListResponse.fromJson;

  @override
  bool get error => throw _privateConstructorUsedError;
  @override
  String get msg => throw _privateConstructorUsedError;
  @override
  List<NameResponseData> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryListResponseCopyWith<_CountryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

NameResponseData _$NameResponseDataFromJson(Map<String, dynamic> json) {
  return _NameResponseData.fromJson(json);
}

/// @nodoc
class _$NameResponseDataTearOff {
  const _$NameResponseDataTearOff();

  _NameResponseData call({required String name, required String unicodeFlag}) {
    return _NameResponseData(
      name: name,
      unicodeFlag: unicodeFlag,
    );
  }

  NameResponseData fromJson(Map<String, Object> json) {
    return NameResponseData.fromJson(json);
  }
}

/// @nodoc
const $NameResponseData = _$NameResponseDataTearOff();

/// @nodoc
mixin _$NameResponseData {
  String get name => throw _privateConstructorUsedError;
  String get unicodeFlag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameResponseDataCopyWith<NameResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameResponseDataCopyWith<$Res> {
  factory $NameResponseDataCopyWith(
          NameResponseData value, $Res Function(NameResponseData) then) =
      _$NameResponseDataCopyWithImpl<$Res>;
  $Res call({String name, String unicodeFlag});
}

/// @nodoc
class _$NameResponseDataCopyWithImpl<$Res>
    implements $NameResponseDataCopyWith<$Res> {
  _$NameResponseDataCopyWithImpl(this._value, this._then);

  final NameResponseData _value;
  // ignore: unused_field
  final $Res Function(NameResponseData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? unicodeFlag = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unicodeFlag: unicodeFlag == freezed
          ? _value.unicodeFlag
          : unicodeFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NameResponseDataCopyWith<$Res>
    implements $NameResponseDataCopyWith<$Res> {
  factory _$NameResponseDataCopyWith(
          _NameResponseData value, $Res Function(_NameResponseData) then) =
      __$NameResponseDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String unicodeFlag});
}

/// @nodoc
class __$NameResponseDataCopyWithImpl<$Res>
    extends _$NameResponseDataCopyWithImpl<$Res>
    implements _$NameResponseDataCopyWith<$Res> {
  __$NameResponseDataCopyWithImpl(
      _NameResponseData _value, $Res Function(_NameResponseData) _then)
      : super(_value, (v) => _then(v as _NameResponseData));

  @override
  _NameResponseData get _value => super._value as _NameResponseData;

  @override
  $Res call({
    Object? name = freezed,
    Object? unicodeFlag = freezed,
  }) {
    return _then(_NameResponseData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unicodeFlag: unicodeFlag == freezed
          ? _value.unicodeFlag
          : unicodeFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameResponseData implements _NameResponseData {
  const _$_NameResponseData({required this.name, required this.unicodeFlag});

  factory _$_NameResponseData.fromJson(Map<String, dynamic> json) =>
      _$_$_NameResponseDataFromJson(json);

  @override
  final String name;
  @override
  final String unicodeFlag;

  @override
  String toString() {
    return 'NameResponseData(name: $name, unicodeFlag: $unicodeFlag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameResponseData &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.unicodeFlag, unicodeFlag) ||
                const DeepCollectionEquality()
                    .equals(other.unicodeFlag, unicodeFlag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(unicodeFlag);

  @JsonKey(ignore: true)
  @override
  _$NameResponseDataCopyWith<_NameResponseData> get copyWith =>
      __$NameResponseDataCopyWithImpl<_NameResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NameResponseDataToJson(this);
  }
}

abstract class _NameResponseData implements NameResponseData {
  const factory _NameResponseData(
      {required String name,
      required String unicodeFlag}) = _$_NameResponseData;

  factory _NameResponseData.fromJson(Map<String, dynamic> json) =
      _$_NameResponseData.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get unicodeFlag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NameResponseDataCopyWith<_NameResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}
