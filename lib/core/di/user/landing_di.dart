import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/data/data_source.dart/splash_local_data_source.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/data/repository/splash_impl.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/domain/use_cases/check_role_log_use_case.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/bloc/splash_bloc_bloc.dart';

class LandingDi {
  final SharedPreferences prefs;
  LandingDi(this.prefs);

  SplashBlocBloc create(){
    final local=SplashLocalDataSource(prefs);
    final repo=SplashImpl(local);
    return SplashBlocBloc(CheckRoleLogUseCase(repo));
  }
}