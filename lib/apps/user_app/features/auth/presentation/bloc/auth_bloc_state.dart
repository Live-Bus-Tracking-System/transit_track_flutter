part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState {}

class AuthLoading extends AuthBlocState {}
class AuthAuthenticated extends AuthBlocState {
  final UserAuthModel user;
  AuthAuthenticated(this.user);
}
class AuthError extends AuthBlocState {
  final String message;
  AuthError(this.message);
}
class AuthUnauthenticated extends AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}
