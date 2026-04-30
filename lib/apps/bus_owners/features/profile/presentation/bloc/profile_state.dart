part of 'profile_bloc.dart';

enum ProfileStatus { intital, loading, success, error }

class ProfileState {
  final ProfileStatus fetchStatus;
  final ProfileModel? model;
  final ProfileStatus dltInitStatus;
  final ProfileStatus dltOtpStatus;
  final ProfileStatus dltConfirmStatus;
  final String? intentedId;
  final String? token;
  final String? error;
  ProfileState({
    this.fetchStatus = ProfileStatus.intital,
    this.model,
    this.dltInitStatus = ProfileStatus.intital,
    this.dltOtpStatus = ProfileStatus.intital,
    this.dltConfirmStatus = ProfileStatus.intital,
    this.token,
    this.intentedId,
    this.error,
  });

  ProfileState copyWithin({
    ProfileStatus? fetchStatus,
    ProfileStatus? dltInitStatus,
    ProfileStatus? dltOtpStatus,
    ProfileStatus? dltConfirmStatus,
    String? intentedId,
    String? token,
    ProfileModel? model,
    String? error,
  }) {
    return ProfileState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      dltInitStatus: dltInitStatus??this.dltInitStatus,
      dltOtpStatus: dltOtpStatus??this.dltOtpStatus,
      dltConfirmStatus: dltConfirmStatus??this.dltConfirmStatus,
      model: model ?? this.model,
      error: this.error,
    );
  }
}
