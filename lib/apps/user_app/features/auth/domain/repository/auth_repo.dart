import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class AuthRepos {
  Future< UserAuthModel>register(UserAuthModel model);
  Future<Either<Failure, UserAuthModel>>userLogin(String email,String password);
  Future<void>logout(bool isLogged);
}