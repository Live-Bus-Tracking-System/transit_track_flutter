import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/data_source/profile_local_data_sorce.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/repository/profile_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class ProfileImpl implements ProfileRepo {
  final ProfileRemoteDataSource source;
  final ProfileLocalDataSorce local;
  ProfileImpl(this.source, this.local);
  @override
  Future<Either<Failure, ProfileModel>> fetchDetails() async {
    try {
      final id = local.getId();
      final data = await source.getDetails(id);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> dltConfirm(String confirmToken) async {
    try {
      final id = local.getId();
      final data = await source.deletePermanent(id, confirmToken);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> dltInit(String password) async {
    try {
      final id = local.getId();
      final data = await source.deleteInit(id, password);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> dltOtpVerify(
    String intentedId,
    String otp,
  ) async {
    try {
      final id = local.getId();
      final data = await source.verifyOtp(id, intentedId, otp);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
