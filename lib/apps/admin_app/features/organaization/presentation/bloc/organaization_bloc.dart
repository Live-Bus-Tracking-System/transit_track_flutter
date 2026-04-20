import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/activate_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/get_all_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/suspend_org_use_case.dart';

part 'organaization_event.dart';
part 'organaization_state.dart';

class OrganaizationBloc extends Bloc<OrganaizationEvent, OrganaizationState> {
  final GetAllUseCase orggAll;
  final ActivateOrgUseCase orgActivate;
  final SuspendOrgUseCase orgSuspend;
  OrganaizationBloc(this.orggAll, this.orgActivate, this.orgSuspend)
    : super(OrganaizationState()) {
    on<OrganaizationEvent>((event, emit) async {
      emit(state.copyWithin(status: OrgStatus.loading));
      final result = await orggAll.call();
      result.fold(
        (error) => emit(
          state.copyWithin(status: OrgStatus.error, error: error.message),
        ),
        (data) => emit(state.copyWithin(status: OrgStatus.success, data: data)),
      );
    });

    on<ActivateOrgEvent>((event, emit) async {
      emit(state.copyWithin(status: OrgStatus.loading));
      final result = await orgActivate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(status: OrgStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(status: OrgStatus.success, orgData: data)),
      );
    });
    on<SuspendOrgEvent>((event, emit) async {
      emit(state.copyWithin(status: OrgStatus.loading));
      final result = await orgActivate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(status: OrgStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(status: OrgStatus.success, orgData: data)),
      );
    });
  }
}
