import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/data/data_source/permit_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/repository/permit_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class PermitImpl extends PermitRepo {
  final PermitRemoteDataSource source;
  PermitImpl(this.source);
  @override
  Future<Either<Failure, List<dynamic>>> getAllPending() async {
    try {
      final data = await source.getAll();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> searchPending(String id) async {
    try {
      final data = await source.searchById(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
