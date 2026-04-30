import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/usecases/get_all_service_counts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/activate_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/de_activate_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/delete_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/get_all_fleet_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/domain/usecases/search_fleet_by_id_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/deactivate_vehicle_use_case.dart';

part 'fleet_event.dart';
part 'fleet_state.dart';

class FleetBloc extends Bloc<FleetEvent, FleetState> {
  final GetAllFleetUseCase getFleet;
  final ActivateFleetUseCase activate;
  final DeActivateFleetUseCase deAct;
  final DeleteFleetUseCase delete;
  final SearchFleetByIdUseCase search;
  FleetBloc(this.getFleet, this.activate, this.deAct, this.delete, this.search)
    : super(FleetState()) {
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

    on<DeleteFLeetEvent>((event, emit) async {
      emit(state.copyWithin(deleteStatus: FleetStatus.loading));

      final result = await delete.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            deleteStatus: FleetStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(deleteStatus: FleetStatus.success, message: data),
        ),
      );
    });

    on<ActivateFLeetEvent>((event, emit) async {
      emit(state.copyWithin(activateStatus: FleetStatus.loading));

      final result = await activate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            activateStatus: FleetStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(activateStatus: FleetStatus.success, message: data),
        ),
      );
    });

    on<DeActivateFLeetEvent>((event, emit) async {
      emit(state.copyWithin(deActivateStatus: FleetStatus.loading));

      final result = await deAct.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            deActivateStatus: FleetStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(
            deActivateStatus: FleetStatus.success,
            message: data,
          ),
        ),
      );
    });

    on<GetFleetByStatusEvent>((event, emit) async {
      emit(state.copyWithin(getAllStatus: FleetStatus.loading));

      final result = await getFleet.call(event.id);
      List<FleetCoverModel> data = [];
      result.fold(
        (error) {
          emit(
            state.copyWithin(
              getAllStatus: FleetStatus.error,
              error: error.message,
            ),
          );
        },
        (d) {
          if (event.status == true) {
            data = d.where((e) => e.isActive == true).toList();
          } else {
            data = d.where((e) => e.isActive == false).toList();
          }
          emit(state.copyWithin(getAllStatus: FleetStatus.success, data: data));
        },
      );
    });

    on<SearchFleetByIdEvent>((event, emit) async {
      emit(state.copyWithin(getAllStatus: FleetStatus.loading));
      final result = await search.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            getAllStatus: FleetStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(getAllStatus: FleetStatus.success, data: [data]),
        ),
      );
    });
  }
}
