import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/docurl_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_remote_data_source.dart';

import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class VehicleImpl implements VehicleRepo {
  final FleetRemoteDataSource source;
  final DocurlRemoteDataSource urlSce;
  final FleetLocalDataSource local;
  VehicleImpl(this.source, this.urlSce, this.local);
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
  Future<Either<Failure, List<VehicleModel>>> getAllVehicles() async {
    try {
      final id = local.getId();
      final data = await source.getALl(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> activateVehcile(String id) async {
    try {
      final data = await source.activate(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> deactivateVehcile(String id) async {
    try {
      final data = await source.deActivate(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteVehcile(String id) async {
    try {
      final id = local.getId();
      final data = await source.delete(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> editVehcile(
    String id,
    VehicleModel model,
  ) async {
    try {
      final data = await source.edit(id, model);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile({
    required PlatformFile file,
    required Function(double, String) progress,
    required Function(String) onLong,
  }) async {
    try {
      final data = await urlSce.upload(
        file: file,
        progress: progress,
        onLong: onLong,
      );
      print('success');
      return Right(data);
    } on ApiExcetion catch (e) {
      print('error other:${e.message}');
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      print('error other only catch:${e.toString()}');
      return Left(NetworkFailure('no internet'));
    }
  }
}
