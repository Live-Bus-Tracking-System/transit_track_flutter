part of 'organaization_bloc.dart';

abstract class OrganaizationEvent {}

class GetAllOrgEvent extends OrganaizationEvent {}

class ActivateOrgEvent extends OrganaizationEvent {
  String id;
  ActivateOrgEvent(this.id);
}

class SuspendOrgEvent extends OrganaizationEvent {
  String id;
  SuspendOrgEvent(this.id);
}
