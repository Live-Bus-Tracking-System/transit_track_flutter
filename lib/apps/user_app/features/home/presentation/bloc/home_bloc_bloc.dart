import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_deatils_use_case.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/domain/usecase/get_populer_route.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final GetPopularRoutesUseCase? getPopularRoutesUseCase;
  final GetRecentRoutesUseCase? getRecentRoutesUseCase;
  final GetSavedBusesUseCase? getSavedBusesUseCase;
  final SaveBusUseCase? saveBusUseCase;
  final SearchRoutesUseCase? searchRoutesUseCase;
  final GetDeatilsUseCase? getDeatilsUseCase;
  final GetRouteStopsUseCase getRouteStopsUseCase;

  HomeBlocBloc(
    this.getPopularRoutesUseCase,
    this.getRecentRoutesUseCase,
    this.getDeatilsUseCase,
    this.getRouteStopsUseCase,
    this.getSavedBusesUseCase,
    this.searchRoutesUseCase,
    this.saveBusUseCase,
  ) : super(HomeBlocInitial()) {
    on<HomeLoadRequested>(_onLoad);
    on<HomeSearchChanged>(_onSearchChanged);
    on<HomeSaveBusToggled>(_onSaveBusToggled);
    on<HomeRefreshRequested>(_onRefresh);
    on<HomeBlocEvent>((event, emit) {});
  }
  Future<void> _onLoad(
    HomeLoadRequested event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(HomeLoading());
    // final popularRoutersResult = await getPopularRoutesUseCase?.call();
    // final GetRecentRoutesUseCase = await getRecentRoutesUseCase()?.call();
    // final SaveBusUseCase = await getSavedBusesUseCase?.call();
    // popularRoutersResult.fold(
    //   , )
  }

  Future<void> _onSearchChanged(
    HomeSearchChanged event,
    Emitter<HomeBlocState> emit,
  ) async {}

  Future<void> _onSaveBusToggled(
    HomeSaveBusToggled event,
    Emitter<HomeBlocState> emit,
  ) async {}
  Future<void> _onRefresh(
    HomeRefreshRequested event,
    Emitter<HomeBlocState> emit,
  ) async {}
}
