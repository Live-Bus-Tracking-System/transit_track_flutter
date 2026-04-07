part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginAuthEvent extends AuthEvent {
  String email;
  String password;
  LoginAuthEvent({
    required this.email,
    required this.password,
  });
}

class LogoutAuthEvent extends AuthEvent {}
