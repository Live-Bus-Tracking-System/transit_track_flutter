part of 'splash_bloc_bloc.dart';

abstract class SplashBlocState {}

final class SplashBlocInitial extends SplashBlocState {}

final class SplashBlocLoading extends SplashBlocState {}

final class NavigateAdmin extends SplashBlocState {}

final class NavigateUser extends SplashBlocState {}

final class NavigateNewUser extends SplashBlocState {}
