import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/repository/profile_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetDpUseCase {
  final ProfileRepo repo;
  GetDpUseCase(this.repo);

  Future<Either<Failure,String?>> call()async{
    return repo.getProfile();
  }
}