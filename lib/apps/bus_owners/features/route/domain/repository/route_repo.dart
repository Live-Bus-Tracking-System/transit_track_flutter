import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';

abstract class RouteRepo {
  Future<PlaceDtlsModel?> getDtls(double ltn,double lng);
}