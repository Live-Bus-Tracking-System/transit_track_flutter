import 'package:transit_track_flutter/apps/user_app/features/splash/data/data_source.dart/splash_local_data_source.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/domain/repository/splash_repo.dart';

class SplashImpl implements SplashRepo {
  final SplashLocalDataSource local;
  SplashImpl(this.local);

  @override
  Map<String, dynamic> getRoleLog() {
    try {
      final data = local.getRoleLogged();
      return data;
    } catch (e) {
      throw Exception('error: ${e.toString()}');
    }
  }
}
