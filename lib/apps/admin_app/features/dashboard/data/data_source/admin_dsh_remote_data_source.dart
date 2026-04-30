import 'package:dio/dio.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class AdminDshRemoteDataSource {
  final DioClient client;
  AdminDshRemoteDataSource(this.client);

  Future<int> getAllOrg() async {
    try {
      final response = await client.dio.get('');
      final raw = response.data as List;
      return raw.length;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
   Future<int> getAllUsers() async {
    try {
      final response = await client.dio.get('');
      final raw = response.data as List;
      return raw.length;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
   Future<int> getAllBuses() async {
    try {
      final response = await client.dio.get('');
      final raw = response.data as List;
      return raw.length;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
   Future<int> getAllRoutes() async {
    try {
      final response = await client.dio.get('');
      final raw = response.data as List;
      return raw.length;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
