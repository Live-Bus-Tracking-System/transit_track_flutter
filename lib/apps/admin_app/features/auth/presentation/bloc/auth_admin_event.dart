part of 'auth_admin_bloc.dart';

abstract class AuthAdminEvent {}

class LoginAuthAdminEvent extends AuthAdminEvent {
  String email;
  String password;
  LoginAuthAdminEvent({
    required this.email,
    required this.password,
  });
}

class LogoutAuthAdminEvent extends AuthAdminEvent {}
