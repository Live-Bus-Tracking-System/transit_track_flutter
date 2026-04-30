import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/repository/profile_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class VerifyOtpUseCase {
  final ProfileRepo repo;
  VerifyOtpUseCase(this.repo);

  Future<Either<Failure,String>> call(String otp,String intentedId)async{
    return repo.dltOtpVerify(intentedId, otp);
  }
}