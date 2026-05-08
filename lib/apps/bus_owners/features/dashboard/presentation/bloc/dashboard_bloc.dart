import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/domain/usecases/get_profile_dp_use_case.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetProfileDpUseCase dp;
  DashboardBloc(this.dp) : super(DashboardState()) {
    on<GetProfileDpEvent>((event, emit) {
      emit(state.copyWithin(imageStatus: DshStatus.loading));
      final result = dp.call();
      result.fold(
        (error) => emit(
          state.copyWithin(imageStatus: DshStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(image: data, imageStatus: DshStatus.success)),
      );
    });
  }
}
