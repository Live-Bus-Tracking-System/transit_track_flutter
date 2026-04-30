part of 'auth_admin_bloc.dart';

enum AuthAdminStatus { initial, loading, success, error }

class AuthAdminState {
  final AuthAdminStatus status;
  final String? error;
  AuthAdminState({this.status = AuthAdminStatus.initial, this.error});

  AuthAdminState copyWithin({AuthAdminStatus? status, String? error}) {
    return AuthAdminState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
