part of 'fleet_bloc.dart';

enum FleetStatus { intial, loading, success, error }

class FleetState {
  final FleetStatus getAllStatus;
  final List<FleetCoverModel> data;
  final String? error;

  FleetState({
    this.getAllStatus = FleetStatus.intial,
    this.data = const [],
    this.error,
  });
  FleetState copyWithin({
    FleetStatus? getAllStatus,
    List<FleetCoverModel>? data,
    String? error,
  }) {
    return FleetState(
      getAllStatus: getAllStatus ?? this.getAllStatus,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
