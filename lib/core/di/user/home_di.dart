import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_deatils_use_case.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/bloc/home_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/domain/usecase/get_populer_route.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class HomeDi {
  DioClientUser? client;
  HomeDi(this.client);

  GetPopularRoutesUseCase? get getPopularRoutesUseCase => null;
  GetRecentRoutesUseCase? get getRecentRoutesUseCase => null;
  GetDeatilsUseCase? get getDeatilsUseCase => null;

  // HomeBlocBloc create() {
  //   return HomeBlocBloc(
  //     getPopularRoutesUseCase!: getPopularRoutesUseCase(client),
  //     getRecentRoutesUseCase!: getRecentRoutesUseCase(client),
  //     getDeatilsUseCase!: getDeatilsUseCase(client),
  //     getRouteStopsUseCase!: getRouteStopsUseCase(client),
  //     getSavedBusesUseCase!: getSavedBusesUseCase(client),
  //     searchRoutesUseCase!: searchRoutesUseCase(client),
  //     saveBusUseCase!: saveBusUseCase(client),
  //   );
  // }
}
