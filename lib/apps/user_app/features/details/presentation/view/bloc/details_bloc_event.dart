part of 'details_bloc_bloc.dart';

abstract class DetailsBlocEvent {}

class DetailsLoadRequested extends DetailsBlocEvent {
  final String busId;
  DetailsLoadRequested(this.busId);
}
