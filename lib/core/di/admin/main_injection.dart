import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/set_logged_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/repository/check_state_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/repository/check_state.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/usecases/check_state.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';
import 'package:transit_track_flutter/core/di/admin/auth_di.dart';
import 'package:transit_track_flutter/core/di/admin/check_di.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class Injection {
  late final DioClient dio;
  late final Box<bool> hive;
  late final AuthDi auth;
  late final CheckDi check;
  Future<void> initDi() async {
    await Hive.initFlutter();
    hive = await Hive.openBox<bool>('check_login');
    dio = DioClient();
    auth = AuthDi();
    await auth.init(dio: dio, hive: hive);
    check = CheckDi();
    await check.init(hive: hive);
  }
}
