import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/data_source.dart/bus_owners_remote_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/model/bus_owners_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/repository/bus_owners_auth_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class BusOwnersAuthImpl implements BusOwnersAuthRepo {
  final BusOwnersRemoteLocalDataSource source;
  BusOwnersAuthImpl(this.source);
  @override
  Future<Either<Failure, BusOwnersModel>> create(BusOwnersModel model) async {
    try {
      final data = await source.create(model);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
