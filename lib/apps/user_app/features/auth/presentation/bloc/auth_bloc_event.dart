part of 'auth_bloc_bloc.dart';

 abstract class AuthUserEvent {}

 class AuthLoginEvent extends AuthUserEvent {
  final String email;
  final String password;
  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthUserEvent {
  String name;
  String phone;
  String email;
  String password;
  AuthRegisterEvent({required this.name,required this.email,required this.phone,required this.password});
}

class UserLocalData extends AuthUserEvent{
  final String? email;
  final String? password;
  UserLocalData({ this.email, this.password});
}

class AppStarted extends AuthUserEvent {}

class AuthLogoutEvent extends AuthUserEvent {}
