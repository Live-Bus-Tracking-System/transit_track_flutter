part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent {}

@override
List<Object?> get props => [];

class HomeLoadRequested extends HomeBlocEvent {
  HomeLoadRequested();
}

class HomeSearchChanged extends HomeBlocEvent {
  final String query;
  HomeSearchChanged(this.query);
  @override
  List<Object> get props => [query];
}

class HomeSaveBusToggled extends HomeBlocEvent {
  final String busId;
  final bool isSaving;
  HomeSaveBusToggled({required this.busId, required this.isSaving});
  @override
  List<Object> get props => [busId, isSaving];
}

class HomeRefreshRequested extends HomeBlocEvent {
  HomeRefreshRequested();
}
