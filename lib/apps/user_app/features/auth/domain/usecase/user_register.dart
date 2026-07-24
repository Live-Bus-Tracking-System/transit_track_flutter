import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class UserRegister {
  final AuthRepos repository;
  UserRegister(this.repository);
  Future<Either<Failure, UserAuthModel>> call(UserAuthModel user) async {
    return await repository.register(user);
  }
}
