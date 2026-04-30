import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetAllFleetsUseCase {
  final VehicleRepo repo;
  GetAllFleetsUseCase(this.repo);

  Future<Either<Failure, List<VehicleModel>>> call() async {
    return repo.getAllVehicles();
  }
}
