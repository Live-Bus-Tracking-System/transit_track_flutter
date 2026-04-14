import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecase/get_deatils.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final GetDeatils details;
  RouteBloc(this.details) : super(RouteLoading()) {
    on<GetPlaceDetailsEvent>((event, emit) async {
      emit(RouteLoading());
      final data = await details.call(
        event.ltn,
        event.lng,
      );
      if (data != null) {
        emit(RouteSuccess(data));
        return;
      }
      emit(RouteError());
    });
  }
}
