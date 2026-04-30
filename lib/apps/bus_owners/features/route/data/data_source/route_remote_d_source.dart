import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/stop_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class RouteRemoteDSource {
  final DioClientUser client;
  RouteRemoteDSource(this.client);

  Future<String> addStop(StopModel model) async {
    try {
      final response = await client.dio.post('/Stops', data: model.toJson());

      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
