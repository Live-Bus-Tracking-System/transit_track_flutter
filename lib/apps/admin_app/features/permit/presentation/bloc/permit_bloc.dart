import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/usecases/get_all_pending_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/usecases/saerch_pending_use_case.dart';

part 'permit_event.dart';
part 'permit_state.dart';

class PermitBloc extends Bloc<PermitEvent, PermitState> {
  final GetAllPendingUseCase permit;
  final SaerchPendingUseCase searrch;
  PermitBloc(this.permit, this.searrch) : super(PermitState()) {
    on<GetAllEvent>((event, emit) async {
      emit(state.copyWithin(getAllStatus: PermitStatus.intial));
      final result = await permit.call();

      result.fold(
        (error) => emit(
          state.copyWithin(
            getAllStatus: PermitStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(getAllStatus: PermitStatus.success, data: data),
        ),
      );
    });

    on<SearchEvent>((event, emit) async {
      emit(state.copyWithin(searchStatus: PermitStatus.intial));
      final result = await searrch.call(event.id);

      result.fold(
        (error) => emit(
          state.copyWithin(
            searchStatus: PermitStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(searchStatus: PermitStatus.success, data: [data]),
        ),
      );
    });
  }
}
