import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/repository/fleet_repo.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/deactivate_vehicle_use_case.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class DeActivateFleetUseCase {
  final FleetRepo repo;

  DeActivateFleetUseCase(this.repo);
  Future<Either<Failure,String>> call(String id)async{
    return repo.deActivateFleet(id);
  }
}