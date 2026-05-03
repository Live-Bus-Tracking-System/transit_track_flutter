part of 'details_bloc_bloc.dart';

abstract class DetailsBlocState {}

final class DetailsBlocInitial extends DetailsBlocState {}

final class DetailsBlocLoading extends DetailsBlocState {}

final class DetailsBlocLoaded extends DetailsBlocState {
  final String busId;
  final String busName;
  final String busNumber;
  final String busRoute;
  final String busStatus;
  DetailsBlocLoaded({
    required this.busId,
    required this.busName,
    required this.busNumber,
    required this.busRoute,
    required this.busStatus,
  });
}

class DetailsBlocError extends DetailsBlocState {
  final String message;
  DetailsBlocError(this.message);
}
