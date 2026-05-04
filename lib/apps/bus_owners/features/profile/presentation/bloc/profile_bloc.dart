import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_confirm_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_init_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/fetch_deatails_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/logout_org_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/verify_otp_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchDeatailsUseCase fetchP;
  final DeleteInitUseCase init;
  final VerifyOtpUseCase otp;
  final DeleteConfirmUseCase confirm;
  final LogoutOrgUseCase logout;
  ProfileBloc(this.fetchP, this.init, this.otp, this.confirm, this.logout)
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

    on<LogoutOrgEvent>((event, emit) async {
      emit(state.copyWithin(logoutStatus: ProfileStatus.loading));
      final result = await logout.call();
      result.fold(
        (error) => emit(
          state.copyWithin(
            logoutStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(logoutStatus: ProfileStatus.success, message: data),
        ),
      );
      emit(state.copyWithin(logoutStatus: ProfileStatus.intital));
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
      emit(state.copyWithin(dltInitStatus: ProfileStatus.intital));
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
      emit(state.copyWithin(dltOtpStatus: ProfileStatus.intital));
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
