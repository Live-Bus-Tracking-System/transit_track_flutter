import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/docurl_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_local_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/repository/vehicle_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/activate_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/create_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/deactivate_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/delete_vehcile_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/edit_vehcile_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/get_all_fleets_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/upload_file_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class FleetDi {
  final DioClientUser client;
  final SharedPreferences prefs;
  FleetDi(this.client, this.prefs);

  VehicleBloc create() {
    final url = DocurlRemoteDataSource(client);
    final pref = FleetLocalDataSource(prefs);
    final source = FleetRemoteDataSource(client);
    final repo = VehicleImpl(source, url, pref);
    return VehicleBloc(
      CreateVehicleUseCase(repo),
      UploadFileUseCase(repo),
      GetAllFleetsUseCase(repo),
      EditVehcileUseCase(repo),
      DeleteVehcileUseCase(repo),
      ActivateVehicleUseCase(repo),
      DeactivateVehicleUseCase(repo),
    );
  }
}
