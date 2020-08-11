// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidModel _$CovidModelFromJson(Map<String, dynamic> json) {
  return CovidModel(
    total_cases: json['total_cases'] as int,
    total_serious_cases: json['total_serious_cases'] as int,
    total_deaths: json['total_deaths'] as int,
    total_recovered: json['total_recovered'] as int,
  )..title = json['title'] as String;
}

Map<String, dynamic> _$CovidModelToJson(CovidModel instance) =>
    <String, dynamic>{
      'total_cases': instance.total_cases,
      'total_serious_cases': instance.total_serious_cases,
      'total_deaths': instance.total_deaths,
      'total_recovered': instance.total_recovered,
      'title': instance.title,
    };
