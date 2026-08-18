part of 'dashboard_bloc.dart';

enum DshStatus { initial, loading, success, error }

class DashboardState {
  final DshStatus imageStatus;
  final String? image;
  final String? message;
  final String? error;

  DashboardState({
    this.imageStatus = DshStatus.initial,
    this.image,
    this.message,
    this.error,
  });

  DashboardState copyWithin({
    DshStatus? imageStatus,
    String? image,
    String? message,
    String? error,
  }) {
    return DashboardState(
      imageStatus: imageStatus ?? this.imageStatus,
      image: image ?? this.image,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}
