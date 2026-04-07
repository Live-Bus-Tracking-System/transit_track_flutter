import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/set_logged_admin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginAdmin login;
  final LogoutAdmin logout;
  final SetLoggedAdmin set;
  AuthBloc(this.login, this.logout, this.set) : super(AuthInitial()) {
    on<LoginAuthEvent>((event, emit) async {
      emit(AuthLoading());
      final data = await login.call(
        AuthModel(email: event.email, password: event.password),
      );

      if (data == 'Success') {
        emit(AuthSuccess());
        await set.call(true);
        return;
      }
      emit(AuthError(data));
    });

    on<LogoutAuthEvent>((event, emit) async {
      emit(AuthLoading());
      final data = await logout.call(false);
      if (data == 'Success') {
        emit(AuthSuccess());
        return;
      }
      emit(AuthError(data));
    });
  }
}
