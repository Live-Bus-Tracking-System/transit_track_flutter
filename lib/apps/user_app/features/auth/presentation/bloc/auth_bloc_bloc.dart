import 'package:bloc/bloc.dart';

import 'package:transit_track_flutter/apps/user_app/features/auth/data/model/auth_model.dart';

import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/login_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/logout_user.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/domain/usecase/user_register.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final LoginUser loginUser;
  final UserRegister registerUser;
  final LogoutUser logoutUser;
  AuthUserBloc({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
  }) : super(AuthUserInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());

      final user = await loginUser(event.email, event.password);
      user.fold((error) => emit(AuthError(error.message)), (data) async {
        if (data.role!.contains('OrgAdmin')) {
          return emit(AuthSuccess(data, role: AuthRole.orgAdmin));
        }
        return emit(AuthSuccess(data));
      });
    });
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());

      final user = await registerUser(
        UserAuthModel(
          name: event.name,
          email: event.email,
          password: event.password,
          phone: event.phone,
        ),
      );

      user.fold(
        (error) => AuthError(error.toString()),
        (data) => AuthSuccess(data),
      );
    });
  }
}
