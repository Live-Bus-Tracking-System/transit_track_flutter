import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_bloc_event.dart';
part 'details_bloc_state.dart';

class DetailsBlocBloc extends Bloc<DetailsBlocEvent, DetailsBlocState> {
  DetailsBlocBloc() : super(DetailsBlocInitial()) {
    on<DetailsBlocEvent>((event, emit) {
      if (event is DetailsLoadRequested) {
        emit(DetailsBlocLoading());
        

      }
    });
  }
}
