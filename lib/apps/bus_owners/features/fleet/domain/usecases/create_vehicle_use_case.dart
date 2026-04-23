import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class CreateVehicleUseCase {
  final VehicleRepo repo;
  CreateVehicleUseCase(this.repo);
  Future<Either<Failure, String>> call(VehicleModel model) async {
    return repo.createVehicle(model);
  }
}
