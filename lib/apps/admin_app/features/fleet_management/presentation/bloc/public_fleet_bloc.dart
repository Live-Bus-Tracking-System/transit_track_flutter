import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'public_fleet_event.dart';
part 'public_fleet_state.dart';

class PublicFleetBloc extends Bloc<PublicFleetEvent, PublicFleetState> {
  PublicFleetBloc() : super(PublicFleetInitial()) {
    on<PublicFleetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
