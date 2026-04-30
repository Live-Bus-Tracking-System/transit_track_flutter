import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  final SharedPreferences? prefe;
  final Dio? dio;
  SplashBlocBloc(this.prefe, this.dio) : super(SplashBlocInitial()) {
    on<SplashBlocEvent>((event, emit) async {
      emit(SplashBlocLoading());
      await Future.delayed(Duration(seconds: 6));

      final role = prefe?.getString("role");
      if (role == "Admin") {
        emit(NavigateAdmin());
      } else if (role == "User") {
        emit(NavigateUser());
      } else {
        emit(NavigateNewUser());
      }
    });
  }
}
