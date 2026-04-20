import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/data_source/admin_dsh_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/model/all_modules_counts_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/repository/admin_dashboard_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class AdminDashboardImpl implements AdminDashboardRepo {
  final AdminDshRemoteDataSource source;
  AdminDashboardImpl(this.source);
  @override
  Future<Either<Failure, int>> getAllBusCount() async {
    try {
      final data = await source.getAllBuses();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, int>> getAllOrgCount() async {
    try {
      final data = await source.getAllOrg();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, int>> getAllRouteCount() async {
    try {
      final data = await source.getAllRoutes();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, int>> getAllUsersCount() async {
    try {
      final data = await source.getAllUsers();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, ModulesCountsModel>> getAllServiceCounts() {
    // TODO: implement getAllServiceCounts
    throw UnimplementedError();
  }
}
