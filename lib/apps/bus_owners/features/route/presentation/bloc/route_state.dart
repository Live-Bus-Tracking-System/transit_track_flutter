part of 'route_bloc.dart';

abstract class RouteState {}

class RouteInitial extends RouteState {}

class RouteLoading extends RouteState {}

class RouteSuccess extends RouteState {
  final PlaceDtlsModel model;
  RouteSuccess(this.model);
}

class RouteError extends RouteState {}
