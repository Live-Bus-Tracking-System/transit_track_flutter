import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/repository/auth_repo.dart';

class UserRegister {
  final AuthRepos repository;
  UserRegister(this.repository);
  Future<UserAuthModel> call(UserAuthModel user) async {
    return await repository.register(user);
  }
}
