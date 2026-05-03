// lib/features/home/domain/usecases/get_popular_routes_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/domain/repository/home_repository.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';
import 'package:transit_track_flutter/core/error/failure.dart';

class GetPopularRoutesUseCase {
  final HomeRepository repository;
  GetPopularRoutesUseCase(this.repository);

  // Future<Either<Failure, List<RouteEntity>>> call() =>
  // repository.getPopularRoutes();
}

class GetRecentRoutesUseCase {
  final HomeRepository repository;
  GetRecentRoutesUseCase(this.repository);

  // Future<Either<Failure, List<RouteEntity>>> call() =>
  //     repository.getRecentRoutes();
}

class SearchRoutesUseCase {
  final HomeRepository repository;
  SearchRoutesUseCase(this.repository);

  // Future<Either<Failure, List<RouteEntity>>> call(String query) =>
  //     repository.searchRoutes(query);
}

class GetRouteDetailUseCase {
  final HomeRepository repository;
  GetRouteDetailUseCase(this.repository);

  // Future<Either<Failure, RouteEntity>> call(String routeId) =>
  //     repository.getRouteDetail(routeId);
}

class GetRouteStopsUseCase {
  final HomeRepository repository;
  GetRouteStopsUseCase(this.repository);

  // Future<Either<Failure, List<StopEntity>>> call(String routeId) =>
  //     repository.getRouteStops(routeId);
}

class GetSavedBusesUseCase {
  final HomeRepository repository;
  GetSavedBusesUseCase(this.repository);

  // Future<Either<Failure, List<RouteEntity>>> call() =>
  //     repository.getSavedBuses();
}

class SaveBusUseCase {
  final HomeRepository repository;
  SaveBusUseCase(this.repository);

  Future<Either<Failure, void>> call(String busId) => repository.saveBus(busId);
}
