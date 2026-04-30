import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class DeactivateVehicleUseCase {
  final VehicleRepo repo;
  DeactivateVehicleUseCase(this.repo);

  Future<Either<Failure, String>> call(String id) async {
    return repo.deactivateVehcile(id);
  }
}
