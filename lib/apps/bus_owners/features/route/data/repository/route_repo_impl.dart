import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/coordinates_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/map_api.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/data_source/route_remote_d_source.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/stop_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/repository/route_repo.dart';
import 'package:transit_track_flutter/core/error/api_excetion.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class RouteRepoImpl extends RouteRepo {
  final MapApi mapApi;
  final CoordinatesApi crdtsApi;
  final RouteRemoteDSource source;
  RouteRepoImpl(this.mapApi, this.crdtsApi, this.source);
  @override
  Future<PlaceDtlsModel> getDtls(double ltn, double lng) async {
    try {
      return mapApi.getDetails(ltn, lng);
    } catch (e) {
      throw Exception('Failed to fetch');
    }
  }

  @override
  Future<List<LatLonModel>> getCrdts(List<PlaceDtlsModel> points) async {
    try {
      return crdtsApi.getCoordinated(points);
    } catch (e) {
      throw Exception('Failed to fetch');
    }
  }

  @override
  Future<Either<Failure, String>> addStop(StopModel model) async {
    try {
      final data = await source.addStop(model);
      return Right(data);
    } on ApiExcetion catch (e) {
      return Left(NetworkFailure(e.message, statusCode: e.statuCode));
    } catch (_) {
      return Left(NetworkFailure('no internet'));
    }
  }
}
