part of 'profile_bloc.dart';

enum ProfileStatus { intital, loading, success, error }

class ProfileState {
  final ProfileStatus fetchStatus;
  final ProfileModel? model;
  final String? error;
  ProfileState({
    this.fetchStatus = ProfileStatus.intital,
    this.model,
    this.error,
  });

  ProfileState copyWithin({
    ProfileStatus? fetchStatus,
    ProfileModel? model,
    String? error,
  }) {
    return ProfileState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      model: model ?? this.model,
      error: this.error,
    );
  }
}
