part of 'vehicle_bloc.dart';

enum VehicleStatus { initial, loading, success, error }

class VehicleState {
  final VehicleStatus createStatus;
  final VehicleStatus uploadRgStatus;
  final VehicleStatus uploadPtStatus;
  final VehicleStatus getAllStatus;
  final VehicleStatus editStatus;
  final VehicleStatus dltStatus;
  final VehicleStatus activateStatus;
  final VehicleStatus deActStatus;
  final String? message;
  final List<VehicleModel>? datas;
  final String? url;

  final String? error;
  VehicleState({
    this.createStatus = VehicleStatus.initial,
    this.uploadRgStatus = VehicleStatus.initial,
    this.uploadPtStatus = VehicleStatus.initial,
    this.editStatus = VehicleStatus.initial,
    this.dltStatus = VehicleStatus.initial,
    this.activateStatus = VehicleStatus.initial,
    this.deActStatus = VehicleStatus.initial,
    this.message,
    this.getAllStatus = VehicleStatus.initial,
    this.datas = const [],
    this.url,

    this.error,
  });

  VehicleState copyWithin({
    VehicleStatus? createStatus,
    VehicleStatus? uploadRgStatus,
    VehicleStatus? uploadPtStatus,
    VehicleStatus? getAllStatus,
    VehicleStatus? editStatus,
    VehicleStatus? dltStatus,
    VehicleStatus? activateStatus,
    VehicleStatus? deActStatus,
    String? message,
    List<VehicleModel>? datas,
    String? url,
    String? error,
  }) {
    return VehicleState(
      createStatus: createStatus ?? this.createStatus,
      uploadRgStatus: uploadRgStatus ?? this.uploadRgStatus,
      uploadPtStatus: uploadPtStatus ?? this.uploadPtStatus,
      getAllStatus: getAllStatus ?? this.getAllStatus,
      editStatus: editStatus ?? this.editStatus,
      dltStatus: dltStatus ?? this.dltStatus,
      activateStatus: activateStatus ?? this.activateStatus,
      deActStatus: deActStatus ?? this.deActStatus,
      message: message ?? this.message,
      datas: datas ?? this.datas,
      url: url ?? this.url,
      error: error ?? this.error,
    );
  }
}
