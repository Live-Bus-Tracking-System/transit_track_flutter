import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/data/model/profile_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/domain/usecases/fetch_deatails_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchDeatailsUseCase fetchP;
  ProfileBloc(this.fetchP) : super(ProfileState()) {
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
  }
}
