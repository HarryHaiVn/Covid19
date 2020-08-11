import 'package:flutter_covid19/data/model/covid_model.dart';

abstract class CovidRepository {
  Future<List<CovidModel>> getListCaseInWorld();
  Future<List<CovidModel>> getListCaseInCountry();
  Future<List<CovidModel>> getListCaseInVietNam();
}
