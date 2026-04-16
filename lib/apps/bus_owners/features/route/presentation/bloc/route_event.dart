part of 'route_bloc.dart';

abstract class RouteEvent {}

class InitialMapEvent extends RouteEvent {}

class SelectLocationDtlsEvent extends RouteEvent {
  final double ltn;
  final double lng;
  SelectLocationDtlsEvent({required this.ltn, required this.lng});
}

class ConfirmLocationDtlsEvent extends RouteEvent {}

class GetCrdtsEvent extends RouteEvent {}

class CancelStopEVent extends RouteEvent {
  int index;
  CancelStopEVent({required this.index});
}
