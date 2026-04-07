import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';

class SetLoggedAdmin {
  final AuthRepo repo;
  SetLoggedAdmin(this.repo);

  Future<void> call(bool isLogged) async {
    await repo.setLogged(isLogged);
  }
}
