import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/repository/fleet_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetAllFleetUseCase {
  final FleetRepo repo;
  GetAllFleetUseCase(this.repo);

  Future<Either<Failure,List<FleetCoverModel>>> call(String orgId)async{
    return repo.getAllFleet(orgId);
  }
}