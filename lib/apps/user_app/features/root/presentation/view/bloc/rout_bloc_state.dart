part of 'rout_bloc_bloc.dart';

abstract class RoutBlocState {}

final class RoutBlocInitial extends RoutBlocState {}

final class RoutBlocLoading extends RoutBlocState {}

final class RoutBlocLoaded extends RoutBlocState {
  final List<RouteEntity> routes;
  RoutBlocLoaded(this.routes);
}

final class RoutBlocError extends RoutBlocState {
  // final String message;
  // RoutBlocError(this.message, {required String message});
}
