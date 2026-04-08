import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';

class LogoutAdmin {
  final AuthRepo repo;
  LogoutAdmin(this.repo);
  Future<String> call(bool isLogged) async {
    return repo.logout(isLogged);
  }
}
