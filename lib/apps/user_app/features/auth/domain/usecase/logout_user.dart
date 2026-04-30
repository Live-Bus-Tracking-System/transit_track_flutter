import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/repository/auth_repo.dart';

class LogoutUser {
  final AuthRepos res;
  LogoutUser(this.res);
  Future<void>call(bool user)async{
    return await res.logout(user); 
  }
}