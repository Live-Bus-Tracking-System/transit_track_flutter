import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(SaveInitial()) {
    on<SaveEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
