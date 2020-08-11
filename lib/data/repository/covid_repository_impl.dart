import 'package:dio/dio.dart';
import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:flutter_covid19/data/remote/covid_api.dart';
import 'package:flutter_covid19/data/repository/covid_repository.dart';
import 'package:flutter_covid19/utils/constants.dart';

class CovidRepositoryImpl implements CovidRepository {
  final _movieApi = CovidApi(Dio(BaseOptions(contentType: "application/json")));

  @override
  Future<List<CovidModel>> getListCaseInWorld() async {
    final response = await _movieApi.getListCaseInWorld();
    return response.results;
  }

  @override
  Future<List<CovidModel>> getListCaseInCountry() async {
    print('movieTitle:------------------');
    List<CovidModel> listCountry = new List();
    final response = await _movieApi.getCaseInCountry();
    List<Map<String, dynamic>> countryitems = response.countryitems;
    countryitems.forEach((map) {
      map.keys.forEach((srtKey) {
        if (srtKey != KEY_CHECK) {
          var value = map[srtKey];
          CovidModel covidModel = CovidModel.fromJson(value);
          listCountry.add(covidModel);
        }
      });
    });
    print(listCountry.length);
    listCountry.sort((a, b) => b.total_cases.compareTo(a.total_cases));
    return listCountry;
  }

  @override
  Future<List<CovidModel>> getListCaseInVietNam() async{
    print("11111111111111111111");
    final response = await _movieApi.getCaseInVietNam();
    print("$response");
    return response.countrydata;
  }
}
