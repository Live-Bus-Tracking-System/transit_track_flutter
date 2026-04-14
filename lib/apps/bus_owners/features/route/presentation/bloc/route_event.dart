part of 'route_bloc.dart';

abstract class RouteEvent {}

class GetPlaceDetailsEvent extends RouteEvent {
  final double ltn;
  final double lng;
  GetPlaceDetailsEvent({required this.ltn,required this.lng});
}
