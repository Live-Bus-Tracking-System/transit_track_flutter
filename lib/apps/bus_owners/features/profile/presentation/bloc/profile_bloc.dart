import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_confirm_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/delete_init_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/fetch_deatails_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/get_dp_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/logout_org_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/set_dp_image_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/update_org_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/verify_otp_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchDeatailsUseCase fetchP;
  final DeleteInitUseCase init;
  final VerifyOtpUseCase otp;
  final DeleteConfirmUseCase confirm;
  final LogoutOrgUseCase logout;
  final UpdateOrgUseCase update;
  final SetDpImageUseCase setP;
  final GetDpUseCase getP;
  ProfileBloc(
    this.fetchP,
    this.init,
    this.otp,
    this.confirm,
    this.logout,
    this.update,
    this.setP,
    this.getP,
  ) : super(ProfileState()) {
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

    on<UpdateOrgEvent>((event, emit) async {
      emit(state.copyWithin(updateStatus: ProfileStatus.loading));
      final result = await update.call(
        ProfileModel(
          id: event.id,
          name: event.name,
          email: event.email,
          phone: event.phone,
        ),
      );
      result.fold(
        (error) => emit(
          state.copyWithin(
            updateStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(state.copyWithin(updateStatus: ProfileStatus.success)),
      );
      emit(state.copyWithin(updateStatus: ProfileStatus.intital));
    });

    on<SetDpProfileEvent>((event, emit) async {
      emit(state.copyWithin(setImageStatus: ProfileStatus.loading));
      final result = await setP.call();
      result.fold(
        (error) => emit(
          state.copyWithin(
            setImageStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) {
          if (data == null) {
            emit(
              state.copyWithin(
                setImageStatus: ProfileStatus.error,
                error: 'Failed',
              ),
            );
            emit(state.copyWithin(setImageStatus: ProfileStatus.intital));
            return;
          }
          emit(
            state.copyWithin(
              setImageStatus: ProfileStatus.success,
              image: data,
            ),
          );
        },
      );
      emit(state.copyWithin(setImageStatus: ProfileStatus.intital));
    });

    on<GetDpProfileEvent>((event, emit) async {
      emit(state.copyWithin(getImageStatus: ProfileStatus.loading));
      final result = await getP.call();
      result.fold(
        (error) => emit(
          state.copyWithin(
            getImageStatus: ProfileStatus.error,
            error: error.message,
          ),
        ),
        (data) {
          if (data == null) {
            return emit(
              state.copyWithin(
                getImageStatus: ProfileStatus.error,
                error: 'Failed',
              ),
            );
          }
          emit(
            state.copyWithin(
              getImageStatus: ProfileStatus.success,
              image: data,
            ),
          );
        },
      );
      emit(state.copyWithin(getImageStatus: ProfileStatus.intital));
    });
  }
}
