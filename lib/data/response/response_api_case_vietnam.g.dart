// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_case_vietnam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiCaseVietNam _$ResponseApiCaseVietNamFromJson(
    Map<String, dynamic> json) {
  return ResponseApiCaseVietNam(
    countrydata: (json['countrydata'] as List)
        ?.map((e) =>
            e == null ? null : CovidModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseApiCaseVietNamToJson(
        ResponseApiCaseVietNam instance) =>
    <String, dynamic>{
      'countrydata': instance.countrydata?.map((e) => e?.toJson())?.toList(),
    };
