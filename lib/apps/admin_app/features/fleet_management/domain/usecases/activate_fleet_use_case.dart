import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/repository/fleet_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class ActivateFleetUseCase {
  final FleetRepo repo;
  ActivateFleetUseCase(this.repo);

  Future<Either<Failure,String>> call(String id)async{
    return repo.activateFleet(id);
  }
}