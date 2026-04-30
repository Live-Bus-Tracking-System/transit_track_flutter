import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class FleetRepo {
  Future<Either<Failure, List<FleetCoverModel>>> getAllFleet(String orgId);
  Future<Either<Failure, String>> deleteFleet(String id);
  Future<Either<Failure, String>> activateFleet(String id);
  Future<Either<Failure, String>> deActivateFleet(String id);
  Future<Either<Failure, FleetCoverModel>> getFLeetById(String id);
}
