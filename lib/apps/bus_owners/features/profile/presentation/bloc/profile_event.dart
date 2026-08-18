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

class LogoutOrgEvent extends ProfileEvent {}

class UpdateOrgEvent extends ProfileEvent {
  String id;
  String name;
  String email;
  String phone;
  UpdateOrgEvent({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}
class SetDpProfileEvent extends ProfileEvent{}
class GetDpProfileEvent extends ProfileEvent{}
