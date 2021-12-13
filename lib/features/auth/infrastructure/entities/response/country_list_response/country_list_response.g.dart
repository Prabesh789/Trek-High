// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryListResponse _$_$_CountryListResponseFromJson(
    Map<String, dynamic> json) {
  return _$_CountryListResponse(
    error: json['error'] as bool,
    msg: json['msg'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => NameResponseData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CountryListResponseToJson(
        _$_CountryListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data,
    };

_$_NameResponseData _$_$_NameResponseDataFromJson(Map<String, dynamic> json) {
  return _$_NameResponseData(
    name: json['name'] as String,
    unicodeFlag: json['unicodeFlag'] as String,
  );
}

Map<String, dynamic> _$_$_NameResponseDataToJson(
        _$_NameResponseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unicodeFlag': instance.unicodeFlag,
    };
