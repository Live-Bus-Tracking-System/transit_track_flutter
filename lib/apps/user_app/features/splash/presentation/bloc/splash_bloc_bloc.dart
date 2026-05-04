import 'package:bloc/bloc.dart';

import 'package:transit_track_flutter/apps/user_app/features/splash/domain/use_cases/check_role_log_use_case.dart';
part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  final CheckRoleLogUseCase roleCheck;
  SplashBlocBloc(this.roleCheck) : super(SplashBlocInitial()) {
    on<SplashBlocEvent>((event, emit) async {
      emit(SplashBlocLoading());
      await Future.delayed(Duration(seconds: 3));
      final role = roleCheck.call();

      if (role['role'] == 'OrgAdmin' && role['logged'] == true) {
        emit(NavigateAdmin());
      } else if (role['role'] == "User" && role['logged'] == true) {
        emit(NavigateUser());
      } else {
        emit(NavigateNewUser());
      }
    });
  }
}
