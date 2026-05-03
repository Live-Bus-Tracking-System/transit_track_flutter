import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/datasocuse/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/data/repository/user_local_auth.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/login_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/logout_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/user_register.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final LoginUser loginUser;
  final UserRegister registerUser;
  final LogoutUser logoutUser;
  // final LocalDataUser localDataSource;
  AuthBlocBloc({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
    // required this.localDataSource
  }) : super(AuthBlocInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUser(event.email, event.password);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError("Login Failed: ${e.toString()}"));
      }
    });
    on<RegisterSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerUser(event.user);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError("Register Failed:${e.toString()}"));
      }
    });
  }
}
