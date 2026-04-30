import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/data_source/profile_local_data_sorce.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/repository/profile_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_confirm_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_init_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/fetch_deatails_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/verify_otp_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class ProfileDi {
  final DioClientUser client;
  final SharedPreferences prefs;
  ProfileDi(this.client, this.prefs);
  ProfileBloc create() {
    final source = ProfileRemoteDataSource(client);
    final local = ProfileLocalDataSorce(prefs);
    final repo = ProfileImpl(source, local);
    return ProfileBloc(
      FetchDeatailsUseCase(repo),
      DeleteInitUseCase(repo),
      VerifyOtpUseCase(repo),
      DeleteConfirmUseCase(repo),
    );
  }
}
