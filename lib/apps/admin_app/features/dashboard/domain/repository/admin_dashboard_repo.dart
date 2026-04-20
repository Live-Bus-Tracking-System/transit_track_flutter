import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/model/all_modules_counts_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class AdminDashboardRepo {
  Future<Either<Failure, int>> getAllOrgCount();
  Future<Either<Failure, int>> getAllBusCount();
  Future<Either<Failure, int>> getAllRouteCount();
  Future<Either<Failure, int>> getAllUsersCount();
  Future<Either<Failure,ModulesCountsModel>> getAllServiceCounts();
}
