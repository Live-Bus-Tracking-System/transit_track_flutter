part of 'auth_bloc_bloc.dart';

 abstract class AuthBlocEvent {}

 class LoginSubmitted extends AuthBlocEvent {
  final String email;
  final String password;
  LoginSubmitted({required this.email, required this.password});
}

class RegisterSubmitted extends AuthBlocEvent {
  final UserAuthModel user;
  RegisterSubmitted(this.user);
}

class UserLocalData extends AuthBlocEvent{
  final String? email;
  final String? password;
  UserLocalData({ this.email, this.password});
}

class AppStarted extends AuthBlocEvent {}

class LogoutRequested extends AuthBlocEvent {}
