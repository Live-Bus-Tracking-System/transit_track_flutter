import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class LogoutUser {
  final AuthRepos res;
  LogoutUser(this.res);
  Future<Either<Failure,bool>> call(bool user) async {
    return await res.logout(user);
  }
}
