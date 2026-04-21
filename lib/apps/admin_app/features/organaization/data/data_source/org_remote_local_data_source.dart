import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class OrgRemoteLocalDataSource {
  final DioClient client;
  OrgRemoteLocalDataSource(this.client);

  Future<List<OrganaizationModel>> getAll() async {
    try {
      final response = await client.dio.get(
        '/Organisations',
        queryParameters: {'Page': 1, 'PageSize': 1},
      );
      final raw = response.data['data']['items'] as List;
      return raw.map((e) => OrganaizationModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<OrganaizationModel> activate(String id) async {
    try {
      final response = await client.dio.get('/Organisations/$id/activate');
      return OrganaizationModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> delete(String id) async {
    try {
      await client.dio.get('/Organisations/$id');
      return 'success';
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<OrganaizationModel> suspent(String id) async {
    try {
      final response = await client.dio.get('/Organisations/$id/suspend');
      return OrganaizationModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<int> fleetCount(String id) async {
    try {
      final response = await client.dio.get(
        '/Vehicles',
        queryParameters: {
          'OrganisationId': id,
          'IncludeInactive': false,
          'Page': 1,
          'PageSize': 1,
        },
      );
      return response.data['data']['totalCount'] as int;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
