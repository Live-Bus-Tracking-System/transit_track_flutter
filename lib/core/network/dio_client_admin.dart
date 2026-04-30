import 'package:dio/dio.dart';

import 'package:transit_track_flutter/core/constants/strings/urls.dart';

class DioClientAdmin {
  final Dio dio;

  DioClientAdmin() : dio = Dio() {
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.extra['withCredentials'] = true;
    dio.options.headers = {'content-type': 'application/json'};
  }
}
