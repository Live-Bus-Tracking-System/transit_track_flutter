part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class FetchDetailsEvent extends ProfileEvent {}

class DeleteInitEvent extends ProfileEvent {
  String password;
  DeleteInitEvent(this.password);
}

class OtpVerifyEvent extends ProfileEvent {
  String otp;
  OtpVerifyEvent(this.otp);
}

class ConfirmDeleteEvent extends ProfileEvent {}

class LogoutOrgEvent extends ProfileEvent{}
