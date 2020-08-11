import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:flutter_covid19/data/repository/covid_repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class CovidBloc {
  var caseCovidWorldListSubject = PublishSubject<List<CovidModel>>();
  var caseCovidCountryListSubject = PublishSubject<List<CovidModel>>();
  var caseCovidVietNamListSubject = PublishSubject<List<CovidModel>>();

  Observable<List<CovidModel>> get covidListWorld =>
      caseCovidWorldListSubject.stream;

  Observable<List<CovidModel>> get covidCountry =>
      caseCovidCountryListSubject.stream;

  Observable<List<CovidModel>> get covidVietNam =>
      caseCovidVietNamListSubject.stream;

  CovidRepositoryImpl _covidRepositoryImpl = CovidRepositoryImpl();

  void getCaseCovidInWorld() async {
    try {
      caseCovidWorldListSubject = PublishSubject<List<CovidModel>>();
      caseCovidWorldListSubject.sink
          .add(await _covidRepositoryImpl.getListCaseInWorld());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      caseCovidWorldListSubject.sink.addError(e);
    }
  }

  void getCaseCovidInCountry() async {
    try {
      caseCovidCountryListSubject = PublishSubject<List<CovidModel>>();
      caseCovidCountryListSubject.sink
          .add(await _covidRepositoryImpl.getListCaseInCountry());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      print("11111111111111111111");
      print("$e");
      caseCovidCountryListSubject.sink.addError(e);
    }
  }

  void getCaseCovidInVietNam() async {
    try {
      caseCovidVietNamListSubject = PublishSubject<List<CovidModel>>();
      caseCovidVietNamListSubject.sink
          .add(await _covidRepositoryImpl.getListCaseInVietNam());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      caseCovidVietNamListSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    caseCovidWorldListSubject.close();
    caseCovidCountryListSubject.close();
    caseCovidVietNamListSubject.close();
  }
}
