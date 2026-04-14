import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';

class GetDeatils {
  final RouteRepo repo;
  GetDeatils(this.repo);

  Future<PlaceDtlsModel?> call(double ltn,double lng)async{
    return repo.getDtls(ltn,lng);
  }
}