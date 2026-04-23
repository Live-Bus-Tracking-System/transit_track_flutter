part of 'fleet_bloc.dart';

abstract class FleetEvent {}

class GetAllFLeetEvent extends FleetEvent {
  String id;
  GetAllFLeetEvent(this.id);
}
