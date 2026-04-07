import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';

class LoginAdmin {
  final AuthRepo repo;
  LoginAdmin(this.repo);

  Future<String> call(AuthModel model) async {
    return  repo.login(model);
  }
}
