part of 'checkstate_bloc.dart';

abstract class CheckstateState {}

class CheckstateInitial extends CheckstateState {}

class CheckstateLoading extends CheckstateState {}

class CheckstateSuccess extends CheckstateState {}

class CheckstateError extends CheckstateState {}
