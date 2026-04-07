import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final RemoteLocaldataSource local;
  final AuthLocalDataSource auth;
  AuthRepoImpl(this.local, this.auth);
  @override
  Future<String> login(AuthModel model) async {
    return local.login(model);
  }

  @override
  Future<String> logout(bool isLogged) async {
     auth.set(isLogged);
    return local.logout();
  }
  
  @override
  Future<void> setLogged(bool isLogged)async {
    await auth.set(isLogged);
  }

 
}
