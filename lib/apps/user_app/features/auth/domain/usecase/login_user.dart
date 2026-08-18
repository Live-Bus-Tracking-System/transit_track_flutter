import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class LoginUser {
  final AuthRepos repo;

  LoginUser({required this.repo});

  Future<Either<Failure, UserAuthModel>> call(
    String email,
    String password,
  ) async {
    return await repo.userLogin(email, password);
  }
}
