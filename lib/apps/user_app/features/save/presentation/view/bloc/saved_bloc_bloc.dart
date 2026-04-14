import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_bloc_event.dart';
part 'saved_bloc_state.dart';

class SavedBlocBloc extends Bloc<SavedBlocEvent, SavedBlocState> {
  SavedBlocBloc() : super(SavedBlocInitial()) {
    on<SavedBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
