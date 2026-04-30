import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class FleetRemoteDataSource {
  final DioClientUser client;
  FleetRemoteDataSource(this.client);

  Future<String> create(VehicleModel model) async {
    try {
      final response = await client.dio.post('/Vehicles', data: model.toJson());
      return response.data['message'];
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<List<VehicleModel>> getALl(String orgId) async {
    try {
      final response = await client.dio.get(
        '/Vehicles',
        queryParameters: {
          "OrganisationId": orgId,
          "IncludeInactive": true,
          "page": 1,
          "PageSize": 1,
        },
      );
      final raw = response.data['data']['items'] as List;
      return raw.map((e) => VehicleModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> edit(String id,VehicleModel model) async {
    try {
      final response = await client.dio.put('/Vehicles/$id',data: model.toJson());
      return response.data['message'];
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
}
