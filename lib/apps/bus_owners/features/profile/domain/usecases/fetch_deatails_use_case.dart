

import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/repository/profile_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class FetchDeatailsUseCase {
  final ProfileRepo repo;
  FetchDeatailsUseCase(this.repo);

  Future<Either<Failure,ProfileModel>> call()async{
    return repo.fetchDetails();
  }
}