// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CovidApi implements CovidApi {
  _CovidApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.thevirustracker.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getListCaseInWorld() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/free-api?global=stats',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseApiListCaseWorld.fromJson(_result.data);
    return value;
  }

  @override
  getCaseInCountry() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/free-api?countryTotals=ALL',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseApiListCaseCountry.fromJson(_result.data);
    return value;
  }

  @override
  getCaseInVietNam() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/free-api?countryTotal=VN',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseApiCaseVietNam.fromJson(_result.data);
    return value;
  }
}
