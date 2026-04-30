import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/lat_lon_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/stop_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/add_stop_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_credts_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/domain/usecases/get_deatils_use_case.dart';
import 'package:transit_track_flutter/core/services/route_calculation.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final GetDeatilsUseCase details;
  final GetCredtsUseCase crdt;
  final RouteCalculation calc;
  final AddStopUseCase stop;
  RouteBloc(this.details, this.crdt, this.calc, this.stop)
    : super(RouteState()) {
    on<InitialMapEvent>((event, emit) {
      if (state.location == null) {
        emit(
          state.copyWithin(location: LatLonModel(lat: 10.8505, lon: 76.2711)),
        );
      } else {
        emit(
          state.copyWithin(
            location: LatLonModel(
              lat: state.location!.lat,
              lon: state.location!.lon,
            ),
          ),
        );
      }
    });

    on<SelectLocationDtlsEvent>((event, emit) async {
      emit(state.copyWithin(sltStopSts: RouteStatus.loading));
      try {
        final data = await details.call(event.ltn, event.lng);
        emit(
          state.copyWithin(
            stopData: data,
            sltStopSts: RouteStatus.success,
            location: LatLonModel(lat: data.lat!, lon: data.lon!),
          ),
        );
      } catch (e) {
        emit(
          state.copyWithin(error: e.toString(), sltStopSts: RouteStatus.error),
        );
      }
    });

    on<ConfirmLocationDtlsEvent>((event, emit) async {
      emit(state.copyWithin(cfrmStopSts: RouteStatus.loading));
      try {
        List<LatLonModel> crd = [];

        List<PlaceDtlsModel> update = List.from(state.listOfStops)
          ..add(state.stopData!);

        if (update.length > 1) {
          final data = await crdt.call(update);
          crd = data;
        }
        emit(
          state.copyWithin(
            listOfStops: update,
            coordinates: crd,
            cfrmStopSts: RouteStatus.success,
          ),
        );
      } catch (e) {
        emit(
          state.copyWithin(cfrmStopSts: RouteStatus.error, error: e.toString()),
        );
      }
    });

    on<CancelStopEVent>((event, emit) async {
      try {
        emit(state.copyWithin(cfrmStopSts: RouteStatus.loading));

        List<dynamic> data = await calc.stopCalculate(
          state.listOfStops,
          event.index,
        );
        emit(
          state.copyWithin(
            listOfStops: data[0],
            coordinates: data[1],
            cfrmStopSts: data[2] ? RouteStatus.initial : RouteStatus.success,
          ),
        );
      } catch (e) {
        emit(
          state.copyWithin(cfrmStopSts: RouteStatus.error, error: e.toString()),
        );
      }
    });

    on<AddStopEvent>((event, emit) async {
      emit(state.copyWithin(stopStatus: RouteStatus.loading));

      final result = await stop.call(
        StopModel(
          name: event.name,
          lat: event.lat,
          lon: event.lon,
          isGlobal: true,
        ),
      );
      result.fold(
        (error) => emit(
          state.copyWithin(stopStatus: RouteStatus.error, error: error.message),
        ),
        (data) => emit(
          state.copyWithin(stopStatus: RouteStatus.success, message: data),
        ),
      );
    });
  }
}
