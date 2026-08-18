import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/repository/profile_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class UpdateOrgUseCase {
  final ProfileRepo repo;
  UpdateOrgUseCase(this.repo);

  Future<Either<Failure, String>> call(ProfileModel model) async {
    return repo.editProfile(model);
  }
}
