part of 'bus_owner_auth_bloc.dart';

abstract class BusOwnerAuthEvent {}

class CreateBusOwnerEvent extends BusOwnerAuthEvent {
  String name;
  String email;
  String phone;
  int type;

  CreateBusOwnerEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
  });
}
