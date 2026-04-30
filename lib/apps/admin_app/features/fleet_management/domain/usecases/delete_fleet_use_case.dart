import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/repository/fleet_repo.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/delete_vehcile_use_case.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class DeleteFleetUseCase {
  final FleetRepo repo;

  DeleteFleetUseCase(this.repo);

  Future<Either<Failure, String>> call(String id) async {
    return repo.deleteFleet(id);
  }
}
