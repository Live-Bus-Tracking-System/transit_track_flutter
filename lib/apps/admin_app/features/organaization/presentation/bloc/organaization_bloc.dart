import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/usecases/get_all_service_counts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/activate_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/delete_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/fleet_count_id_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/get_all_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/suspend_org_use_case.dart';

part 'organaization_event.dart';
part 'organaization_state.dart';

class OrganaizationBloc extends Bloc<OrganaizationEvent, OrganaizationState> {
  final GetAllUseCase orggAll;
  final ActivateOrgUseCase orgActivate;
  final SuspendOrgUseCase orgSuspend;
  final DeleteOrgUseCase orgDelete;
  final FleetCountIdUseCase orgFleetCount;
  OrganaizationBloc(
    this.orggAll,
    this.orgActivate,
    this.orgSuspend,
    this.orgDelete,
    this.orgFleetCount,
  ) : super(OrganaizationState()) {
    on<GetAllOrgEvent>((event, emit) async {
      emit(state.copyWithin(getStatus: OrgStatus.loading));
      final result = await orggAll.call();
      result.fold(
        (error) => emit(
          state.copyWithin(getStatus: OrgStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(getStatus: OrgStatus.success, data: data)),
      );
    });

    on<ActivateOrgEvent>((event, emit) async {
      emit(state.copyWithin(actStatus: OrgStatus.loading));
      final result = await orgActivate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(actStatus: OrgStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(actStatus: OrgStatus.success, orgData: data)),
      );
      emit(state.copyWithin(actStatus: OrgStatus.initial));
    });
    on<SuspendOrgEvent>((event, emit) async {
      emit(state.copyWithin(supStatus: OrgStatus.loading));
      final result = await orgActivate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(supStatus: OrgStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(supStatus: OrgStatus.success, orgData: data)),
      );
      emit(state.copyWithin(supStatus: OrgStatus.initial));
    });

    on<DeleteOrgEvent>((event, emit) async {
      emit(state.copyWithin(dlStatus: OrgStatus.loading));
      final result = await orgDelete.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(dlStatus: OrgStatus.error, error: error.message),
        ),
        (data) => emit(state.copyWithin(dlStatus: OrgStatus.success)),
      );
      emit(state.copyWithin(dlStatus: OrgStatus.initial));
    });

    on<GetFleetCountById>((event, emit) async {
      emit(state.copyWithin(tlfStatus: OrgStatus.loading));
      final result = await orgFleetCount.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(tlfStatus: OrgStatus.error, error: error.message),
        ),
        (data) => emit(
          state.copyWithin(tlfStatus: OrgStatus.success, totalFleet: data),
        ),
      );
      emit(state.copyWithin(tlfStatus: OrgStatus.initial));
    });

    on<GetOrgByStatusEvent>((event, emit) async {
      emit(state.copyWithin(getStatus: OrgStatus.loading));

      final result = await orggAll.call();
      List<OrganaizationModel> data = [];
      result.fold(
        (error) {
          emit(
            state.copyWithin(getStatus: OrgStatus.error, error: error.message),
          );
        },
        (d) {
          if (event.status == 2) {
            data = d.where((e) => e.status == 2).toList();
          } else if (event.status == 3) {
            data = d.where((e) => e.status == 3).toList();
          } else if (event.status == 1) {
            data = d.where((e) => e.status == 1).toList();
          } else {
            data = d.where((e) => e.status == 4).toList();
          }
          emit(state.copyWithin(getStatus: OrgStatus.success, data: data));
        },
      );
    });
  }
}
