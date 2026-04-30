part of 'admin_dsh_bloc.dart';

enum AdminDshStatus { initial, loading, success, error }

class AdminDshState {
  final AdminDshStatus status;
  final ModulesCountsModel? data;
  final String? error;

  AdminDshState({this.status = AdminDshStatus.initial, this.data, this.error});

  AdminDshState copyWithin({
    AdminDshStatus? status,
    ModulesCountsModel? data,
    String? error,
  }) {
    return AdminDshState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
