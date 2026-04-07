import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'permit_event.dart';
part 'permit_state.dart';

class PermitBloc extends Bloc<PermitEvent, PermitState> {
  PermitBloc() : super(PermitInitial()) {
    on<PermitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
