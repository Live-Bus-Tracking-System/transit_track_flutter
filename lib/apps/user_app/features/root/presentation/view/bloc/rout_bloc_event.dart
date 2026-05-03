part of 'rout_bloc_bloc.dart';

abstract class RoutBlocEvent {}

class RoutBlocLoadRequested extends RoutBlocEvent {
  // int get routeId => null;
}

class SearchRoutesUseCase extends RoutBlocEvent {
  final String query;
  SearchRoutesUseCase(this.query);
}

class GetDeatialsUseCase extends RoutBlocEvent {
  final String routedId;
  GetDeatialsUseCase(this.routedId);
}

class GetRouteStopsUseCase extends RoutBlocEvent {
  final String routedId;
  GetRouteStopsUseCase(this.routedId);
}
