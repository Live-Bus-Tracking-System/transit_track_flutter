import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/entites/repository/auth_repo.dart';

class LocalDataUser {
  final AuthRepos repo;

  LocalDataUser({required this.repo});

  Future<UserAuthModel> call(String? email, String? password) async {
    return await repo.userLogin( email!,password!);
  }
}