import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:image_picker/image_picker.dart';
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

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      await local.deleteRoleLoggedId();
      final data = await source.logOut();
      return Right(data);
    } on ApiExcetion catch (e) {
      print('error ${e.statuCode}');
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      print('error ${e.toString()}');
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String>> editProfile(ProfileModel model) async {
    try {
      final data = await source.update(model);
      return Right(data);
    } on ApiExcetion catch (e) {
      print('error ${e.statuCode}');
      return Left(ServerFailure(e.message, statusCode: e.statuCode));
    } catch (e) {
      print('error ${e.toString()}');
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String?>> getProfile() async {
    try {
      final id = local.getId();
      final file = local.getDpImage(id);

      return Right(file);
    } catch (e) {
      print('error ${e.toString()}');
      return Left(NetworkFailure('no internet'));
    }
  }

  @override
  Future<Either<Failure, String?>> setProfile() async {
    try {
      final picker = ImagePicker();
      final file = await picker.pickImage(source: ImageSource.gallery);
      final id = local.getId();
      if (file == null) return Right(null);
      await local.setDpImage(file.path, id);
      return Right('Success');
    } catch (e) {
      print('error ${e.toString()}');
      return Left(NetworkFailure('no internet'));
    }
  }
}
