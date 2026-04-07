import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'private_fleet_event.dart';
part 'private_fleet_state.dart';

class PrivateFleetBloc extends Bloc<PrivateFleetEvent, PrivateFleetState> {
  PrivateFleetBloc() : super(PrivateFleetInitial()) {
    on<PrivateFleetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
