import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class LoginAdmin {
  final AuthAdminRepo repo;
  LoginAdmin(this.repo);

  Future<Either<Failure,AdminModel>> call(AdminModel model) async {
    return  repo.login(model);
  }
}
