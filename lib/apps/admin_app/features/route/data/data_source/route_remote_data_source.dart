import 'package:dio/dio.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class RouteRemoteDataSource {
  final DioClientAdmin client;
  RouteRemoteDataSource(this.client);

  Future<List<dynamic>> getAllRoutes() async {
    try {
      final response = await client.dio.get('/Routes');
      final raw = response.data[''];
      return [];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
