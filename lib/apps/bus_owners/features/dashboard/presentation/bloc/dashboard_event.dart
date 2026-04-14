part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class LoadMapEvent extends DashboardEvent{}

class UpdateLocationEvent extends DashboardEvent {
  final double lat;
  final double lng;

  UpdateLocationEvent(this.lat ,this.lng);
}