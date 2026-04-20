import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = 'https://transittrack.mooo.com/api';
    dio.options.extra['withCredentials'] = true;
    dio.options.headers = {'content-type': 'application/json'};
  }
}
