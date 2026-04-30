

import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/docurl_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/data_source/fleet_remote_data_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/repository/vehicle_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/repository/vehicle_repo.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/create_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/upload_file_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/bloc/vehicle_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class FleetDi {
  final DioClient client;
  FleetDi(this.client);

  VehicleBloc create(){
    final url=DocurlRemoteDataSource();
    final source=FleetRemoteDataSource(client);
    final repo=VehicleImpl(source,url);
    return VehicleBloc(CreateVehicleUseCase(repo),UploadFileUseCase(repo));

  }
}