
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/repository/auth_repo.dart';

class LoginUser {
  final AuthRepos repo;

  LoginUser({required this.repo});

  Future<String> call(UserAuthModel model) async {
    return await repo.login(model);
  }
}
