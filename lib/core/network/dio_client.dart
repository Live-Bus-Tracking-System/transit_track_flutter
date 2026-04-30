import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = 'https://transittrack.mooo.com/api';
    dio.options.extra['withCredentials'] = true;
    dio.options.headers = {'content-type': 'application/json'};
    _cookie();
  }
  Future<void> _cookie() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      final cookieJar = PersistCookieJar(
        storage: FileStorage('${dir.path}/cookies'),
      );

      dio.interceptors.add(CookieManager(cookieJar));
    }
  }
}
