import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';

class GetCredtsUseCase {
  final RouteRepo repo;
  GetCredtsUseCase(this.repo);
  Future<List<LatLonModel>> call(List<PlaceDtlsModel> points)async{
    return repo.getCrdts(points);
  }
}