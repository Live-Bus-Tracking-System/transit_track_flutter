part of 'home_bloc_bloc.dart';

abstract class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeInitial extends HomeBlocState {
  HomeInitial();
}

class HomeLoading extends HomeBlocState {
  HomeLoading();
}

class HomeLoaded extends HomeBlocState {
  final List<RouteEntity> recentRoutes;
  final List<RouteEntity> popularRoutes;
  final List<RouteEntity> searchResults;
  final String searchQuery;
  final bool isSearching;

  HomeLoaded({
    required this.recentRoutes,
    required this.popularRoutes,
    this.searchResults = const [],
    this.searchQuery = '',
    this.isSearching = false,
  });

  HomeLoaded copyWith({
    List<RouteEntity>? recentRoutes,
    List<RouteEntity>? popularRoutes,
    List<RouteEntity>? searchResults,
    String? searchQuery,
    bool? isSearching,
  }) {
    return HomeLoaded(
      recentRoutes: recentRoutes ?? this.recentRoutes,
      popularRoutes: popularRoutes ?? this.popularRoutes,
      searchResults: searchResults ?? this.searchResults,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object?> get props => [
    recentRoutes,
    popularRoutes,
    searchResults,
    searchQuery,
    isSearching,
  ];
}

class HomeError extends HomeBlocState {
  final String message;
  HomeError(this.message);
  @override
  List<Object> get props => [message];
}
