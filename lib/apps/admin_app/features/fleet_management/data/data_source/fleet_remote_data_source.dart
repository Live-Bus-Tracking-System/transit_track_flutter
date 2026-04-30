import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class FleetRemoteDataSource {
  final DioClient client;
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
}
