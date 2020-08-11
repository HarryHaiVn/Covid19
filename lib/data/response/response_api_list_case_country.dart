import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api_list_case_country.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseApiListCaseCountry {
  List<Map<String, dynamic>> countryitems;

  ResponseApiListCaseCountry({this.countryitems});

  factory ResponseApiListCaseCountry.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiListCaseCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseApiListCaseCountryToJson(this);
}
