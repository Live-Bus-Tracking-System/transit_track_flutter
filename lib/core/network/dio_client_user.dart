import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transit_track_flutter/core/constants/strings/urls.dart';

class DioClientUser {
  late final Dio dio;
  Future<Dio> initDio() async {
    dio = Dio();
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.extra['withCredentials'] = true;
    dio.options.headers = {'content-type': 'application/json'};
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      final cookieJar = PersistCookieJar(
        storage: FileStorage('${dir.path}/cookies'),
      );
      dio.interceptors.add(CookieManager(cookieJar));
    }
    return dio;
  }
}
