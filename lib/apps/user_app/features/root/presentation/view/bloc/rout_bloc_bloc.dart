import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rout_bloc_event.dart';
part 'rout_bloc_state.dart';

class RoutBlocBloc extends Bloc<RoutBlocEvent, RoutBlocState> {
  RoutBlocBloc() : super(RoutBlocInitial()) {
    on<RoutBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
