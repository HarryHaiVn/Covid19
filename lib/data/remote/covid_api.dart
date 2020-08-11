import 'package:dio/dio.dart';
import 'package:flutter_covid19/data/response/response_api_case_vietnam.dart';
import 'package:flutter_covid19/data/response/response_api_list_case_country.dart';
import 'package:flutter_covid19/data/response/response_api_list_case_world.dart';
import 'package:flutter_covid19/utils/constants.dart';
import 'package:retrofit/http.dart';

part 'covid_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CovidApi {
  factory CovidApi(Dio dio, {String baseUrl}) = _CovidApi;

  @GET("/free-api?global=stats")
  Future<ResponseApiListCaseWorld> getListCaseInWorld();

  @GET("/free-api?countryTotals=ALL")
  Future<ResponseApiListCaseCountry> getCaseInCountry();

  @GET("/free-api?countryTotal=VN")
  Future<ResponseApiCaseVietNam> getCaseInVietNam();
}
