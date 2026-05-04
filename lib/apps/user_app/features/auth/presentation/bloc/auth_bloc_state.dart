part of 'auth_bloc_bloc.dart';

enum AuthRole { user, orgAdmin }

abstract class AuthBlocState {}

class AuthLoading extends AuthBlocState {}

class AuthAuthenticated extends AuthBlocState {
  final UserAuthModel user;
  final AuthRole role;
  AuthAuthenticated(this.user,{this.role=AuthRole.user});
}

class AuthError extends AuthBlocState {
  final String message;
  AuthError(this.message);
}

class AuthUnauthenticated extends AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}
