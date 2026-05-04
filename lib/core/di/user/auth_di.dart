import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_auth_service.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/repository/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/login_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/logout_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/user_register.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class AuthDi {
  final DioClientUser client;
  final SharedPreferences prefs;
  AuthDi(this.client,this.prefs);

  AuthBlocBloc create(){
    final local=AuthUserLocalDSource(prefs);
    final source=UserAuthService(client);
    final repo=UserReposImp(remoteService: source, localDataService: local);
    return AuthBlocBloc(loginUser: LoginUser(repo: repo), registerUser: UserRegister(repo), logoutUser: LogoutUser(repo));
  }
}