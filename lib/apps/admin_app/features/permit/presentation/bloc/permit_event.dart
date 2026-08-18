part of 'permit_bloc.dart';

 class PermitEvent {}
 class GetAllEvent extends PermitEvent{}
 class SearchEvent extends PermitEvent{
  String id;
  SearchEvent(this.id);
 }
