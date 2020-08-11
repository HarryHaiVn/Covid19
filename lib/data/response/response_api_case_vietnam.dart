
import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api_case_vietnam.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseApiCaseVietNam {
  List<CovidModel> countrydata;

  ResponseApiCaseVietNam({this.countrydata});

  factory ResponseApiCaseVietNam.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiCaseVietNamFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseApiCaseVietNamToJson(this);
}
