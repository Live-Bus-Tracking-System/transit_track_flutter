import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class FleetRemoteDataSource {
  final DioClientAdmin client;
  FleetRemoteDataSource(this.client);

  Future<List<FleetCoverModel>> getAll(String orgId) async {
    try {
      final response = await client.dio.get(
        '/Vehicles',
        queryParameters: {
          'OrganisationId': orgId,
          'IncludeInactive': true,
          'Page': 1,
          'PageSize': 1,
        },
      );
      final raw = response.data['data']['items'] as List;
      return raw.map((e) => FleetCoverModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> delete(String id) async {
    try {
      final response = await client.dio.delete('/Vehicles/$id');
      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> activate(String id) async {
    try {
      final response = await client.dio.put('/Vehicles/$id/activate');
      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> deActivate(String id) async {
    try {
      final response = await client.dio.put('/Vehicles/$id/deactivate');

      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<FleetCoverModel> getVehiclesById(String id) async {
    try {
      final response = await client.dio.get('/Vehicles/$id');
      final raw = response.data['data'];
      return FleetCoverModel.fromJson(raw);
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
