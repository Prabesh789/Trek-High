import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_list_response.freezed.dart';
part 'country_list_response.g.dart';

@freezed
class CountryListResponse with _$CountryListResponse {
  const factory CountryListResponse({
    required bool error,
    required String msg,
    required List<NameResponseData> data,
  }) = _CountryListResponse;
  factory CountryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryListResponseFromJson(json);
}

@freezed
class NameResponseData with _$NameResponseData {
  const factory NameResponseData({
    required String name,
    required String unicodeFlag,
  }) = _NameResponseData;
  factory NameResponseData.fromJson(Map<String, dynamic> json) =>
      _$NameResponseDataFromJson(json);
}
