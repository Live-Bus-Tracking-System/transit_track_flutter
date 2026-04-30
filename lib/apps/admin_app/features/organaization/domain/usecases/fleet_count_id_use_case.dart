import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/repository/organaization_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class FleetCountIdUseCase {
  final OrganaizationRepo repo;
  FleetCountIdUseCase(this.repo);

  Future<Either<Failure,int>> call(String id)async{
    return repo.totalFleeCount(id);
  }
}