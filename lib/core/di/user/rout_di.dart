import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/map_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/repository/route_repo_impl.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecase/get_deatils.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';

class RoutDi {
  RouteRepoImpl init() {
    final MapApi api = MapApi();
    final RouteRepoImpl impl = RouteRepoImpl(api);
    return impl;
  }

  RouteBloc bloc() {
    final impl = init();
    return RouteBloc(GetDeatils(impl));
  }
}
