import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class UploadFileUseCase {
  final VehicleRepo repo;
  UploadFileUseCase(this.repo);

  Future<Either<Failure, String>> call(PlatformFile file) async {
    return repo.uploadFile(file);
  }
}
