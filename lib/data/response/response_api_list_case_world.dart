import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_api_list_case_world.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseApiListCaseWorld {
  List<CovidModel> results;

  ResponseApiListCaseWorld({this.results});

  factory ResponseApiListCaseWorld.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiListCaseWorldFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseApiListCaseWorldToJson(this);
}
