import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class ProfileRemoteDataSource {
  final DioClient client;
  ProfileRemoteDataSource(this.client);

  Future<ProfileModel> getDetails(String id) async {
    try {
      final response = await client.dio.get('/Organisations/$id');
      final raw = response.data['data'];
      return ProfileModel.fromJson(raw);
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
