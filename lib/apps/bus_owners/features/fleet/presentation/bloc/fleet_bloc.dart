import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fleet_event.dart';
part 'fleet_state.dart';

class FleetBloc extends Bloc<FleetEvent, FleetState> {
  FleetBloc() : super(FleetInitial()) {
    on<FleetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
