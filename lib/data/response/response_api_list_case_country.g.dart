// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_list_case_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiListCaseCountry _$ResponseApiListCaseCountryFromJson(
    Map<String, dynamic> json) {
  return ResponseApiListCaseCountry(
    countryitems: (json['countryitems'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseApiListCaseCountryToJson(
        ResponseApiListCaseCountry instance) =>
    <String, dynamic>{
      'countryitems': instance.countryitems,
    };
