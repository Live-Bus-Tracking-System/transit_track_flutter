import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/model/all_modules_counts_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/usecases/get_all_service_counts.dart';

part 'admin_dsh_event.dart';
part 'admin_dsh_state.dart';

class AdminDshBloc extends Bloc<AdminDshEvent, AdminDshState> {
  final GetAllCountsUseCase counts;
  AdminDshBloc(this.counts) : super(AdminDshState()) {
    on<GetAllServiceCounts>((event, emit) async {
      emit(state.copyWithin(status: AdminDshStatus.loading));
      final result = await counts.call();
      result.fold(
        (error) => emit(
          state.copyWithin(status: AdminDshStatus.error, error: error.message),
        ),
        (data) =>
            emit(state.copyWithin(status: AdminDshStatus.success, data: data)),
      );
    });
  }
}
