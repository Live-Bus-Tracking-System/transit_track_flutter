part of 'organaization_bloc.dart';

enum OrgStatus { initial, loading, success, error }

class OrganaizationState {
  final OrgStatus status;
  final List<OrganaizationModel>? data;
  final OrganaizationModel? orgData;
  final String? error;
  OrganaizationState({
    this.status = OrgStatus.initial,
    this.data = const [],
    this.orgData,
    this.error,
  });

  OrganaizationState copyWithin({
    OrgStatus? status,
    List<OrganaizationModel>? data,
    OrganaizationModel? orgData,
    String? error,
  }) {
    return OrganaizationState(
      status: status ?? this.status,
      data: data ?? this.data,
      orgData: orgData??this.orgData,
      error: error ?? this.error,
    );
  }
}
