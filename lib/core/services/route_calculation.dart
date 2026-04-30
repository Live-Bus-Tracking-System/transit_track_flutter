import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';

class RouteCalculation {
  final RouteRepo repo;
  RouteCalculation(this.repo);

  Future<List<dynamic>> stopCalculate(
    List<PlaceDtlsModel> stops,
    int index,
  ) async {
    List<LatLonModel>? crd;

    List<PlaceDtlsModel> updatedStop = List.from(stops)..removeAt(index);
    if (stops.length > 2) {
      final data = await repo.getCrdts(updatedStop);
      crd = data;
    } else if (stops.length > 1) {
      crd = [];
    }
    return [updatedStop, crd, updatedStop.isEmpty];
  }
}
