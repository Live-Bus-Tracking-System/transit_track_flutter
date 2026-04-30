part of 'organaization_bloc.dart';

enum OrgStatus { initial, loading, success, error }

class OrganaizationState {
  final OrgStatus getStatus;
  final OrgStatus dlStatus;
  final OrgStatus supStatus;
  final OrgStatus actStatus;
  final OrgStatus fltStatus;
  final OrgStatus tlfStatus;
  final OrgStatus searchStatus;
  final int? totalFleet;
  final List<OrganaizationModel>? data;
  final OrganaizationModel? orgData;
  final String? error;
  OrganaizationState({
    this.getStatus = OrgStatus.initial,
    this.dlStatus = OrgStatus.initial,
    this.supStatus = OrgStatus.initial,
    this.actStatus = OrgStatus.initial,
    this.fltStatus = OrgStatus.initial,
    this.tlfStatus = OrgStatus.initial,
    this.searchStatus = OrgStatus.initial,
    this.totalFleet,
    this.data = const [],
    this.orgData,
    this.error,
  });

  OrganaizationState copyWithin({
    OrgStatus? getStatus,
    OrgStatus? dlStatus,
    OrgStatus? supStatus,
    OrgStatus? actStatus,
    OrgStatus? tlfStatus,
    OrgStatus? searchStatus,
    int? totalFleet,
    List<OrganaizationModel>? data,
    OrganaizationModel? orgData,
    String? error,
  }) {
    return OrganaizationState(
      getStatus: getStatus ?? this.getStatus,
      dlStatus: dlStatus ?? this.dlStatus,
      supStatus: supStatus ?? this.supStatus,
      actStatus: actStatus ?? this.actStatus,
      tlfStatus: tlfStatus ?? this.tlfStatus,
      totalFleet: totalFleet ?? this.totalFleet,
      searchStatus: searchStatus ?? this.searchStatus,
      data: data ?? this.data,
      orgData: orgData ?? this.orgData,
      error: error ?? this.error,
    );
  }
}
