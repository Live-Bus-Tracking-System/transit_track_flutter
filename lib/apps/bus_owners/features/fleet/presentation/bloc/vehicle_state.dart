part of 'vehicle_bloc.dart';

enum VehicleStatus { initial, loading, success, error }

class VehicleState {
  final VehicleStatus createStatus;
  final VehicleStatus uploadRgStatus;
  final VehicleStatus uploadPtStatus;
  final String? url;

  final String? error;
  VehicleState({
    this.createStatus = VehicleStatus.initial,
    this.uploadRgStatus = VehicleStatus.initial,
    this.uploadPtStatus=VehicleStatus.initial,
    this.url,

    this.error,
  });

  VehicleState copyWithin({
    VehicleStatus? createStatus,
    VehicleStatus? uploadRgStatus,
    VehicleStatus? uploadPtStatus,
    String? url,
    String? error,
  }) {
    return VehicleState(
      createStatus: createStatus ?? this.createStatus,
      uploadRgStatus: uploadRgStatus ?? this.uploadRgStatus,
      uploadPtStatus: uploadPtStatus??this.uploadPtStatus,
      url: url ?? this.url,
      error: error ?? this.error,
    );
  }
}
