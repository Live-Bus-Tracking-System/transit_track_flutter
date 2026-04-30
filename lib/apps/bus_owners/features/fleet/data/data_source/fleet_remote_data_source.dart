import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class FleetRemoteDataSource {
  final DioClient client;
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
}
