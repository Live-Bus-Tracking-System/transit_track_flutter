part of 'fleet_bloc.dart';

abstract class FleetEvent {}

class GetAllFLeetEvent extends FleetEvent {
  String id;
  GetAllFLeetEvent(this.id);
}

class DeleteFLeetEvent extends FleetEvent {
  String id;
  DeleteFLeetEvent(this.id);
}

class ActivateFLeetEvent extends FleetEvent {
  String id;
  ActivateFLeetEvent(this.id);
}

class DeActivateFLeetEvent extends FleetEvent {
  String id;
  DeActivateFLeetEvent(this.id);
}

class GetFleetByStatusEvent extends FleetEvent {
  bool status;
  String id;
  GetFleetByStatusEvent(this.id,this.status);
}

class SearchFleetByIdEvent extends FleetEvent{
  String id;
  SearchFleetByIdEvent(this.id);
}
