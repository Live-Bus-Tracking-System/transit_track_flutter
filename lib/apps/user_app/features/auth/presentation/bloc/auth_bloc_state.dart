part of 'auth_bloc_bloc.dart';

enum AuthRole { user, orgAdmin }

abstract class AuthUserState {}

class AuthLoading extends AuthUserState {}

class AuthSuccess extends AuthUserState {
  final UserAuthModel user;
  final AuthRole role;
  AuthSuccess(this.user,{this.role=AuthRole.user});
}

class AuthError extends AuthUserState {
  final String message;
  AuthError(this.message);
}

class AuthUnauthenticated extends AuthUserState {}

final class AuthUserInitial extends AuthUserState {}
