part of 'bus_owner_auth_bloc.dart';

class BusOwnerAuthState {}

class BusOwnerAuthInitial extends BusOwnerAuthState {}

class BusOwnerAuthLoading extends BusOwnerAuthState {}

class BusOwnerAuthSuccess extends BusOwnerAuthState {}

class BusOwnerAuthError extends BusOwnerAuthState {
  String error;
  BusOwnerAuthError(this.error);
}
