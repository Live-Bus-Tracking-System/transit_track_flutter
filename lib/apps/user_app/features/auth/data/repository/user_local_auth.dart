import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_auth_service.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class UserReposImp implements AuthRepos {
  final UserAuthService remoteService;
  final AuthUserLocalDSource localDataService;

  UserReposImp({required this.remoteService, required this.localDataService});

  @override
  Future<Either<Failure, UserAuthModel>> userLogin(
    String email,
    String password,
  ) async {
    try {
      final user = await remoteService.login(email: email, password: password);

      if (user.role!.contains('OrgAdmin')) {
        await localDataService.setRole('OrgAdmin');
        await localDataService.setId(user.roleId!);
      } else {
        await localDataService.setRole('User');
        await localDataService.setId(user.id!);
      }

      return Right(user);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet $e'));
    }
  }

  @override
  Future<Either<Failure, UserAuthModel>> register(UserAuthModel user) async {
     try {
        final newUser = await remoteService.register(user);
        return Right(newUser);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet $e'));
    }
  }

  Future<Either<Failure, bool>> logout(bool isLogged) async {
    try {
      await remoteService.logout();
      await localDataService.clearData();
      return Right(true);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet $e'));
    }
  }
}
