import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/data/data_source/dsh_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/data/repository/dsh_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/domain/usecases/get_profile_dp_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DshDi {
  final SharedPreferences prefs;
  DshDi(this.prefs);

  DashboardBloc create(){
    final local=DshLocalDataSource(prefs);
    final repo=DshImpl(local);
    return DashboardBloc(GetProfileDpUseCase(repo));
  }
}