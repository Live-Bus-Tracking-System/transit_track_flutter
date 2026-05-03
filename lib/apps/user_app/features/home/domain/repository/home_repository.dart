import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/entity/route_entity.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/entity/stop_entity.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RouteEntity>>> getPopularRoutes();
  Future<Either<Failure, List<RouteEntity>>> getRecentRoutes();
  Future<Either<Failure, List<RouteEntity>>> searchRoutes(String query);
  Future<Either<Failure, RouteEntity>> getRouteDetail(String routeId);
  Future<Either<Failure, List<StopEntity>>> getRouteStops(String routeId);
  Future<Either<Failure, List<RouteEntity>>> getSavedBuses();
  Future<Either<Failure, void>> saveBus(String busId);
  Future<Either<Failure, void>> removeSavedBus(String busId);
}
