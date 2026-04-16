import 'package:hive_flutter/adapters.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/set_logged_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class AuthDi {
  late final AuthBloc bloc;

  Future<void> init({required DioClient dio, required Box<bool> hive}) async {
    final remote = RemoteLocaldataSource(dio);
    final local = AuthLocalDataSource(hive);
    final AuthRepoImpl impl = AuthRepoImpl(remote, local);
    bloc = AuthBloc(LoginAdmin(impl), LogoutAdmin(impl), SetLoggedAdmin(impl));
  }
}
