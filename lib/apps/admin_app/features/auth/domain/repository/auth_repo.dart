import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class AuthAdminRepo {
  Future<Either<Failure, AdminModel>> login(AdminModel model);
  Future<Either<Failure, String>> logout();
}
