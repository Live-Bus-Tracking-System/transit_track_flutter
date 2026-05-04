import 'package:transit_track_flutter/apps/user_app/features/splash/domain/repository/splash_repo.dart';

class CheckRoleLogUseCase {
  final SplashRepo repo;
  CheckRoleLogUseCase(this.repo);

  Map<String,dynamic> call(){
    return repo.getRoleLog();
  }
}