import 'package:bloc/bloc.dart';


import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';

import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/login_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/logout_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/user_register.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final LoginUser loginUser;
  final UserRegister registerUser;
  final LogoutUser logoutUser;
  AuthBlocBloc({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
  }) : super(AuthBlocInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());

      final user = await loginUser(event.email, event.password);
      user.fold((error) => emit(AuthError(error.message)), (data) async {
        if (data.role.contains('OrgAdmin')) {
          return emit(AuthAuthenticated(data, role: AuthRole.orgAdmin));
        }
        return emit(AuthAuthenticated(data));
      });
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
