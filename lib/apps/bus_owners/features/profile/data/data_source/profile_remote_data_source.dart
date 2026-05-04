import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/error_handler.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class ProfileRemoteDataSource {
  final DioClientUser client;
  ProfileRemoteDataSource(this.client);

  Future<ProfileModel> getDetails(String id) async {
    print('api called profile');
    try {
      final response = await client.dio.get('/Organisations/$id');
      final raw = response.data['data'];
      print('$raw');
      return ProfileModel.fromJson(raw);
    } on DioException catch (e) {
      print('api called profile failed');
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> logOut() async {
    try {
      final response = await client.dio.post('/auth/logout');
      final raw = response.data['data']['message'];
      print('$raw');
      return raw;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> deleteInit(String id, String password) async {
    try {
      final response = await client.dio.get(
        '/Organisations/$id/deletion/initiate',
        data: {'password': password},
      );
      final raw = response.data['data'];
      return raw;
    } on DioException catch (e) {
      print('error init${e.response?.statusCode}');
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> verifyOtp(String id, String intentedId, String otp) async {
    try {
      final response = await client.dio.get(
        '/Organisations/$id/deletion/verify-otp',
        data: {"intentId": intentedId, "otp": otp},
      );
      final raw = response.data['data'];
      return raw;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }

  Future<String> deletePermanent(String id, String cnfirmToken) async {
    try {
      final response = await client.dio.get(
        '/Organisations/$id/deletion/confirm',
        data: {"confirmToken": cnfirmToken},
      );
      final raw = response.data['data'];
      return raw;
    } on DioException catch (e) {
      throw ApiExcetion(
        message: ErrorHandler.handle(e),
        statuCode: e.response?.statusCode,
      );
    }
  }
}
