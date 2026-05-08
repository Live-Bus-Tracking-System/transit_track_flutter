part of 'permit_bloc.dart';

enum PermitStatus { intial, loading, success, error }

class PermitState {
  final PermitStatus getAllStatus;
  final PermitStatus searchStatus;
  final List<dynamic>? data;
  final String? error;
  final String? message;

  PermitState({
    this.getAllStatus = PermitStatus.intial,
    this.searchStatus = PermitStatus.intial,
    this.data,
    this.error,
    this.message,
  });

  PermitState copyWithin({
    PermitStatus? getAllStatus,
    PermitStatus? searchStatus,
    List<dynamic>? data = const [],
    String? error,
    String? message,
  }) {
    return PermitState(
      getAllStatus: getAllStatus ?? this.getAllStatus,
      searchStatus: searchStatus ?? this.searchStatus,
      data: data ?? this.data,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
