import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/data/repository/serve_exception.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class UserAuthService {
  final DioClientUser client;
  UserAuthService(this.client);
  // register

  Future<UserAuthModel> register(UserAuthModel useer) async {
    try {
      Response respo = await client.dio.post(
        "/auth/signup",
        data: useer.toMap(),
      );
      return UserAuthModel.fromJson(respo.data['data']);
    } catch (e) {
      throw ServeException(message: "");
    }
  }

  Future<UserAuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response respo = await client.dio.post(
        "/auth/login",
        data: {'email': email, 'password': password},
      );
      return UserAuthModel.fromJson(respo.data['data']);
    } catch (e) {
      throw ServeException(message: "Somthing error");
    }
  }

  Future<void> logout() async {
    final respo = await client.dio.post("auth/logout");
    return respo.data;
  }
}
