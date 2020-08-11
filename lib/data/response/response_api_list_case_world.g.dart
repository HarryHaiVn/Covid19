// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_list_case_world.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiListCaseWorld _$ResponseApiListCaseWorldFromJson(
    Map<String, dynamic> json) {
  return ResponseApiListCaseWorld(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : CovidModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseApiListCaseWorldToJson(
        ResponseApiListCaseWorld instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
