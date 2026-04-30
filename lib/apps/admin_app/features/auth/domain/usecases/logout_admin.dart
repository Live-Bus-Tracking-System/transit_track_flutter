import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class LogoutAdmin {
  final AuthAdminRepo repo;
  LogoutAdmin(this.repo);
  Future<Either<Failure, String>> call() async {
    return repo.logout();
  }
}
