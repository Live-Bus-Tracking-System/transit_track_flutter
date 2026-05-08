import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class SearchVehicleUseCase {
  final VehicleRepo repo;
  SearchVehicleUseCase(this.repo);
  Future<Either<Failure, VehicleModel>> call(String id) {
    return repo.getVehicleById(id);
  }
}
