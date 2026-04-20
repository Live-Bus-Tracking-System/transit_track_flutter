import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/repository/check_state_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/usecases/check_state.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';

class CheckDi {
  final SharedPreferences prefs;
  CheckDi(this.prefs);
  CheckstateBloc create() {
    final local = LocalDataSource(prefs);
    final impl = CheckStateImpl(local);
    return CheckstateBloc(CheckStateCase(impl));
  }
}
