import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/domain/repository/dsh_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetProfileDpUseCase {
  final DshRepo repo;
  GetProfileDpUseCase(this.repo);

  Either<Failure,String?> call(){
    return repo.getDp();
  }
}