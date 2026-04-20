import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class AuthAdminRepoImpl extends AuthAdminRepo {
  final AuthAdminRemoteLocaldataSource local;
  final AuthAdminLocalDataSource auth;
  AuthAdminRepoImpl(this.local, this.auth);
  @override
  Future<Either<Failure, AdminModel>> login(AdminModel model) async {
    try {
      final data = await local.login(model);

      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final data=await local.logout();
   
      return Right(data);
    } on ApiExcetion catch (e) {
     
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet'));
    }
  }


  

}
