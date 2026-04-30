import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/data_source/fleet_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/repository/fleet_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class FleetImpl implements FleetRepo {
  final FleetRemoteDataSource source;
  FleetImpl(this.source);
  @override
  Future<Either<Failure, List<FleetCoverModel>>> getAllFleet(
    String orgId,
  ) async {
    try {
      final data = await source.getAll(orgId);
      return right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
