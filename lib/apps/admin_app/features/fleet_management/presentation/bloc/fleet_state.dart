part of 'fleet_bloc.dart';

enum FleetStatus { intial, loading, success, error }

class FleetState {
  final FleetStatus getAllStatus;
  final FleetStatus activateStatus;
  final FleetStatus deActivateStatus;
  final FleetStatus deleteStatus;
  final String? message;
  final List<FleetCoverModel> data;
  final String? error;

  FleetState({
    this.getAllStatus = FleetStatus.intial,
    this.activateStatus = FleetStatus.intial,
    this.deActivateStatus = FleetStatus.intial,
    this.deleteStatus = FleetStatus.intial,
    this.message,
    this.data = const [],
    this.error,
  });
  FleetState copyWithin({
    FleetStatus? getAllStatus,
    FleetStatus? activateStatus,
    FleetStatus? deActivateStatus,
    FleetStatus? deleteStatus,
    String? message,
    List<FleetCoverModel>? data,
    String? error,
  }) {
    return FleetState(
      getAllStatus: getAllStatus ?? this.getAllStatus,
      activateStatus: activateStatus ?? this.activateStatus,
      deActivateStatus: deActivateStatus ?? this.deActivateStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      message: message??this.message,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
