import 'package:dio/dio.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class PermitRemoteDataSource {
  final DioClientAdmin client;
  PermitRemoteDataSource(this.client);

  Future<List<dynamic>> getAll() async {
    try {
      final response = await client.dio.get(
        '/VehiclePermits/pending',
        queryParameters: {'Page': 1, 'PageSize': 1},
      );
      final raw = response.data['data']['items'] as List;
      return [];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

   Future<dynamic> searchById(String id) async {
    try {
      final response = await client.dio.get(
        '/VehiclePermits/pending/$id',
    
      );
     
      return '';
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}