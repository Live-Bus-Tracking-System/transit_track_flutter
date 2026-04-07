import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/core/error/exception.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class RemoteLocaldataSource {
  final DioClient client;
  RemoteLocaldataSource(this.client);
  Future<String> login(AuthModel model) async {
    try {
      Response data = await client.dio.post('/auth/login', data: model.toJson());

      return exception(data.statusCode);
    } on DioException catch (e) {
        return exception(e.response?.statusCode);
    }
  }
   Future<String> logout() async {
    try {
      Response data = await client.dio.post('/auth/logout');

      return exception(data.statusCode);
    } catch (e) {
      return 'Logout failed';
    }
  }
}
