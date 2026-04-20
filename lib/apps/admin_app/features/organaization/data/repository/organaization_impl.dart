import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/data_source/org_remote_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/repository/organaization_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class OrganaizationImpl implements OrganaizationRepo {
  final OrgRemoteLocalDataSource source;
  OrganaizationImpl(this.source);

  @override
  Future<Either<Failure, OrganaizationModel>> editOrgStatus() {
    // TODO: implement editOrgStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrganaizationModel>>> getAllOrg() async {
    try {
      final data = await source.getAll();
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, OrganaizationModel>> activateOrg(String id) async {
    try {
      final data = await source.activate(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, OrganaizationModel>> suspendOrg(String id) async {
    try {
      final data = await source.suspent(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
