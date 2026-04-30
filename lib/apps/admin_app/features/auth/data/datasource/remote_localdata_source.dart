import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/auth_error_handler.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class AuthAdminRemoteLocaldataSource {
  final DioClientAdmin client;
  AuthAdminRemoteLocaldataSource(this.client);
  Future<AdminModel> login(AdminModel model) async {
    try {
      Response response = await client.dio.post(
        '/auth/login',
        data: model.toJson(),
      );

      return AdminModel.fromJson(response.data);
    } on DioException catch (e) {
      print('${e.message}');
      throw ApiExcetion(
        message: AuthErrorHandler.handler(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> logout() async {
    try {
      await client.dio.post('/auth/logout');

      return 'Success';
    } on DioException catch (e) {
      throw ApiExcetion(
        message: AuthErrorHandler.handler(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
