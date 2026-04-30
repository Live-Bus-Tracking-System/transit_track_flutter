import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/usecases/get_all_service_counts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/get_all_fleet_use_case.dart';

part 'fleet_event.dart';
part 'fleet_state.dart';

class FleetBloc extends Bloc<FleetEvent, FleetState> {
  final GetAllFleetUseCase getFleet;
  FleetBloc(this.getFleet) : super(FleetState()) {
    on<GetAllFLeetEvent>((event, emit) async {
      emit(state.copyWithin(getAllStatus: FleetStatus.loading));
      final result = await getFleet.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            getAllStatus: FleetStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(getAllStatus: FleetStatus.success, data: data),
        ),
      );
    });
  }
}
