import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBlocBloc() : super(SplashBlocInitial()) {
    on<SplashBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
