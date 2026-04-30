import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/repository/auth_repo_impl.dart';

import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_admin_bloc.dart';

import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class AuthDi {
  final DioClientAdmin client;
  final SharedPreferences prefs;
  AuthDi(this.client, this.prefs);
  AuthAdminBloc create() {
    final remote = AuthAdminRemoteLocaldataSource(client);
    final local = AuthAdminLocalDataSource(prefs);
    final AuthAdminRepoImpl impl = AuthAdminRepoImpl(remote, local);
    return AuthAdminBloc(LoginAdmin(impl), LogoutAdmin(impl));
  }
}
