import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/model/bus_owners_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class BusOwnersRemoteLocalDataSource {
  final DioClientUser client;

  BusOwnersRemoteLocalDataSource(this.client);
  Future<BusOwnersModel> create(BusOwnersModel model) async {
    try {
      final response = await client.dio.post(
        '/Organisations',
        data: model.toJson(),
      );
      final raw = response.data['data']['id'];
      return BusOwnersModel.fromJson(raw);
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> logOut() async {
    try {
      final response = await client.dio.post('/auth/logout');

      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
