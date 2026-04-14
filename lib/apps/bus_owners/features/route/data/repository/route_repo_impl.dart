import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/map_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';

class RouteRepoImpl extends RouteRepo {
  final MapApi api;
  RouteRepoImpl(this.api);
  @override
  Future<PlaceDtlsModel?> getDtls(double ltn,double lng) async {
    return api.getDetails(ltn, lng);
  }
}
