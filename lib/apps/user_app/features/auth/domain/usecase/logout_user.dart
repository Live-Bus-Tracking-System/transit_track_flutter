import 'package:transit_track_flutter/apps/user_app/features/auth/data/repository/auth_repo.dart';

class LogoutUser {
  final AuthRepos res;
  LogoutUser(this.res);
  Future<void>call()async{
    return await res.logout();
  }
}