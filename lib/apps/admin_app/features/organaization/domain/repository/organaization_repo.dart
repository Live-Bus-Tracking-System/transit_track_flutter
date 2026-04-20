import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class OrganaizationRepo {
  Future<Either<Failure, List<OrganaizationModel>>> getAllOrg();
  Future<Either<Failure, OrganaizationModel>> activateOrg(String id);
  Future<Either<Failure, OrganaizationModel>> suspendOrg(String id);
  Future<Either<Failure, OrganaizationModel>> editOrgStatus();
}
