import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_bloc_event.dart';
part 'map_bloc_state.dart';

class MapBlocBloc extends Bloc<MapBlocEvent, MapBlocState> {
  MapBlocBloc() : super(MapBlocInitial()) {
    on<MapBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
