import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/stop_model.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class RouteRepo {
  Future<PlaceDtlsModel> getDtls(double ltn,double lng);
  Future<List<LatLonModel>> getCrdts(List<PlaceDtlsModel> points);
  Future<Either<Failure,String>> addStop(StopModel model);
}