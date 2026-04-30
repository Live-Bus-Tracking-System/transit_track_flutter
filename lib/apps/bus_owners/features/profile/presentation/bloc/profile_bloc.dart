import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_confirm_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_init_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/fetch_deatails_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/verify_otp_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchDeatailsUseCase fetchP;
  final DeleteInitUseCase init;
  final VerifyOtpUseCase otp;
  final DeleteConfirmUseCase confirm;
  ProfileBloc(this.fetchP, this.init, this.otp, this.confirm)
    : super(ProfileState()) {
    on<FetchDetailsEvent>((event, emit) async {
      emit(state.copyWithin(fetchStatus: ProfileStatus.loading));
      final result = await fetchP.call();
      result.fold(
        (error) => emit(
          state.copyWithin(
            fetchStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(fetchStatus: ProfileStatus.success, model: data),
        ),
      );
    });

    on<DeleteInitEvent>((event, emit) async {
      emit(state.copyWithin(dltInitStatus: ProfileStatus.loading));
      final result = await init.call(event.password);
      result.fold(
        (error) => emit(
          state.copyWithin(
            dltInitStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(
            dltInitStatus: ProfileStatus.success,
            intentedId: data,
          ),
        ),
      );
    });

    on<OtpVerifyEvent>((event, emit) async {
      emit(state.copyWithin(dltOtpStatus: ProfileStatus.loading));
      final result = await otp.call(event.otp, state.intentedId!);
      result.fold(
        (error) => emit(
          state.copyWithin(
            dltOtpStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(dltOtpStatus: ProfileStatus.success, token: data),
        ),
      );
    });

    on<ConfirmDeleteEvent>((event, emit) async {
      emit(state.copyWithin(dltConfirmStatus: ProfileStatus.loading));
      final result = await confirm.call(state.token!);
      result.fold(
        (error) => emit(
          state.copyWithin(
            dltConfirmStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) =>
            emit(state.copyWithin(dltConfirmStatus: ProfileStatus.success)),
      );
    });
  }
}
