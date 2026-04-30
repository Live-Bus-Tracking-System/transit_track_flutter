import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';

part 'auth_admin_event.dart';
part 'auth_admin_state.dart';

class AuthAdminBloc extends Bloc<AuthAdminEvent, AuthAdminState> {
  final LoginAdmin login;
  final LogoutAdmin logout;
  AuthAdminBloc(this.login, this.logout) : super(AuthAdminState()) {
    on<LoginAuthAdminEvent>((event, emit) async {
  
      emit(state.copyWithin(status: AuthAdminStatus.loading));

      final result = await login.call(
        AdminModel(email: event.email, password: event.password),
      );
      result.fold(
        (error) {
          emit(
            state.copyWithin(error: error.message, status: AuthAdminStatus.error),
          );
        },
        (_) {
      
          emit(state.copyWithin(status: AuthAdminStatus.success));
        },
      );
    });

    on<LogoutAuthAdminEvent>((event, emit) async {
  
      emit(state.copyWithin(status: AuthAdminStatus.loading));

      final result = await logout.call();
      result.fold(
        (error) {
          emit(state.copyWithin(status: AuthAdminStatus.error));
        },
        (_) {
   
          emit(state.copyWithin(status: AuthAdminStatus.success));
        },
      );
    });
  }
}
