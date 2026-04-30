import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';

abstract class AuthRepos {
  Future<UserAuthModel>register(UserAuthModel model);
  Future<UserAuthModel>userLogin(String email,String password);
  Future<void>logout(bool isLogged);
}