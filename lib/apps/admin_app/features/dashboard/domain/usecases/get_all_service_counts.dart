import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/model/all_modules_counts_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/repository/admin_dashboard_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetAllCountsUseCase {
  final AdminDashboardRepo repo;
  GetAllCountsUseCase(this.repo);

  Future<Either<Failure,ModulesCountsModel>> call()async{
    return repo.getAllServiceCounts();
  }
}