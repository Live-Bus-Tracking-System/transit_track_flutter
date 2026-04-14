import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_bloc_event.dart';
part 'landing_bloc_state.dart';

class LandingBlocBloc extends Bloc<LandingBlocEvent, LandingBlocState> {
  LandingBlocBloc() : super(LandingBlocInitial()) {
    on<LandingBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
