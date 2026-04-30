

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class VehicleRepo {
  Future<Either<Failure, String>> createVehicle(VehicleModel model);
  Future<Either<Failure,String>> uploadFile({
    required PlatformFile file,
    required Function(double, String) progress,
    required Function(String) onLong,
  });
  Future<Either<Failure, List<VehicleModel>>> getAllVehicles();
  Future<Either<Failure, String>> editVehcile(String id, VehicleModel model);
  Future<Either<Failure, String>> deleteVehcile(String id);
  Future<Either<Failure, String>> activateVehcile(String id);
  Future<Either<Failure, String>> deactivateVehcile(String id);
}
