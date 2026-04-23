import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/docurl_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_remote_data_source.dart';

import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class VehicleImpl implements VehicleRepo {
  final FleetRemoteDataSource source;
  final DocurlRemoteDataSource url;
  VehicleImpl(this.source, this.url);
  @override
  Future<Either<Failure, String>> createVehicle(VehicleModel model) async {
    try {
      final data = await source.create(model);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(PlatformFile file) async {
    try {
      final data = await url.upload(file);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
