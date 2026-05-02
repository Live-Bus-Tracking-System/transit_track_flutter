import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/entity/route_entity.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/domain/usecase/get_populer_route.dart';

part 'rout_bloc_event.dart';
part 'rout_bloc_state.dart';

class RoutBlocBloc extends Bloc<RoutBlocEvent, RoutBlocState> {
  final GetDeatialsUseCase? _getDeatialsUseCase;
  final GetRouteStopsUseCase? _getRouteStopsUseCase;
  final SearchRoutesUseCase? _searchRoutesUseCase;
  final GetSavedBusesUseCase? _getSavedBusesUseCase;
  final SaveBusUseCase? _saveBusUseCase;
  RoutBlocBloc(
    this._getDeatialsUseCase,
    this._getRouteStopsUseCase,
    this._searchRoutesUseCase,
    this._getSavedBusesUseCase,
    this._saveBusUseCase,
  ) : super(RoutBlocInitial()) {
    on<RoutBlocEvent>((event, emit) {});
    on<RoutBlocLoadRequested>(_onload);
    // on<SearchRoutesUseCase>(_onsearch);
    // on<GetDeatialsUseCase>(_ondetails);
    // on<GetRouteStopsUseCase>(_onRouteStops);
  }

  Future<void> _onload(
    RoutBlocLoadRequested event,
    Emitter<RoutBlocState> emit,
  ) async {
    emit(RoutBlocLoading());
    try {
      // final route = await _getDeatialsUseCase?.call(event.routeId);
      // emit(RoutBlocLoaded(route: route));
    } catch (e) {
      // emit(RoutBlocError(message: e.toString()));
    }
  }
}
