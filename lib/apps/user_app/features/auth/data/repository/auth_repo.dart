import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';

abstract class AuthRepos {
  Future<String>login(UserAuthModel model);
  Future<void>logout();
}