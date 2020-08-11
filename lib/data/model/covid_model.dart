import 'package:json_annotation/json_annotation.dart';

part 'covid_model.g.dart';

@JsonSerializable()
class CovidModel {
  int total_cases;
  int total_serious_cases;
  int total_deaths;
  int total_recovered;
  String title;

  CovidModel(
      {this.total_cases,
      this.total_serious_cases,
      this.total_deaths,
      this.total_recovered});

  factory CovidModel.fromJson(Map<String, dynamic> json) =>
      _$CovidModelFromJson(json);

  Map<String, dynamic> toJson() => _$CovidModelToJson(this);
}
