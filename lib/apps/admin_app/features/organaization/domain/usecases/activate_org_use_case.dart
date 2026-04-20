import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/repository/organaization_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class ActivateOrgUseCase {
  final OrganaizationRepo repo;
  ActivateOrgUseCase(this.repo);

  Future<Either<Failure,OrganaizationModel>> call(String id)async{
    return repo.activateOrg(id);
  }
}