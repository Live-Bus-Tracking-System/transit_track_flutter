import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> fetchDetails();
  Future<Either<Failure, String>> dltInit(String password);
  Future<Either<Failure, String>> dltOtpVerify(String intentedId,String otp);
  Future<Either<Failure, String>> dltConfirm(String confirmToken);
  Future<Either<Failure,String>> logout();
}
