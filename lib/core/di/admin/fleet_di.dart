import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/data_source/fleet_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/repository/fleet_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/activate_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/de_activate_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/delete_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/get_all_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/search_fleet_by_id_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/bloc/fleet_bloc.dart';

import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class FleetDi {
  final DioClientAdmin client;
  FleetDi(this.client);

  FleetBloc create() {
    final source = FleetRemoteDataSource(client);
    final repo = FleetImpl(source);
    return FleetBloc(
      GetAllFleetUseCase(repo),
      ActivateFleetUseCase(repo),
      DeActivateFleetUseCase(repo),
      DeleteFleetUseCase(repo),
      SearchFleetByIdUseCase(repo),
    );
  }
}
