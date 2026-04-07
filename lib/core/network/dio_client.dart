import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl:
              'https://transittrack-eqbwb9afhuamfuhm.southindia-01.azurewebsites.net/api',
          headers: {'content-type': 'application/json'},
        ),
      );
}
