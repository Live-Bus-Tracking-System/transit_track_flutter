import 'package:dio/dio.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/data/repository/serve_exception.dart';
import 'package:transit_track_flutter/core/error/exception.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class UserAuthService {
  final Dio client = DioClient().dio;


  // register

  Future<UserAuthModel> register(UserAuthModel useer)async{
    try {
      Response respo = await client.post("UserAuth/ signup",data:useer.toMap());
      return UserAuthModel.fromJson(respo.data['data']);
    } catch (e) {
      throw ServeException(message: exception(400));
    }
  }

  Future<UserAuthModel>login({required String email,required String password})async {
    try {
      Response respo =await client.post("userauth/login",data: {'email':email,'password': password});
      return UserAuthModel.fromJson(respo.data['data']);
    } catch (e) {
      throw ServeException(message: "Somthing error");
    }
  }
  Future<void> logout()async{
    final respo= await client.post("userauth/logout");
    return respo.data;
  } 
}