import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/coordinates_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/map_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/repository/route_repo_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_credts_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_deatils_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';
import 'package:transit_track_flutter/core/services/route_calculation.dart';

class RoutDi {
  RouteRepoImpl init() {
    final MapApi api = MapApi();
    final CoordinatesApi crd=CoordinatesApi();
    final RouteRepoImpl impl = RouteRepoImpl(api,crd);
   
    return impl;
  }

  RouteBloc bloc() {
    final impl = init();
    return RouteBloc(GetDeatilsUseCase(impl),GetCredtsUseCase(impl),RouteCalculation(impl));
  }
}
