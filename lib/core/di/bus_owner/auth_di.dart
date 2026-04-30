import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/data_source.dart/bus_owner_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/data_source.dart/bus_owners_remote_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/repository/bus_owners_auth_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/repository/bus_owners_auth_repo.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/usecases/create_bus_owner_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/usecases/logout_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/presentation/bloc/bus_owner_auth_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class AuthDi {
  final DioClientUser client;
  final SharedPreferences prefs;
  AuthDi(this.client,this.prefs);

  BusOwnerAuthBloc create(){
    final source=BusOwnersRemoteLocalDataSource(client);
    final local=BusOwnerLocalDataSource(prefs);
    final repo=BusOwnersAuthImpl(source,local);
    return BusOwnerAuthBloc(CreateBusOwnerUseCase(repo),LogoutBusOwnerUseCase(repo));
  }
}