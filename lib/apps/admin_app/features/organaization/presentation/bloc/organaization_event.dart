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

class DeleteOrgEvent extends OrganaizationEvent {
  String id;
  DeleteOrgEvent(this.id);
}

class GetFleetCountById extends OrganaizationEvent{
 String id;
 GetFleetCountById(this.id);
}

class GetOrgByStatusEvent extends OrganaizationEvent{
  int status;
  GetOrgByStatusEvent(this.status);
}

class SearchOrgByIdEvent extends OrganaizationEvent{
  String id;
  SearchOrgByIdEvent(this.id);
}