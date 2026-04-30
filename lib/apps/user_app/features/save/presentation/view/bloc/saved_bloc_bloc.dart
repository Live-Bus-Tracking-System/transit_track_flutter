// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';

// part 'saved_bloc_event.dart';
// part 'saved_bloc_state.dart';

// class SavedBusesBloc extends Bloc<SavedBusesEvent, SavedBusesState> {
//   // final GetSavedBuses _getSavedBuses;

//   SavedBusesBloc(this._getSavedBuses) : super(SavedBusesInitial()) {
//     on<SavedBusesLoadRequested>(_onLoad);
//     on<SavedBusesToggleRequested>(_onToggle);
//   }

//   Future<void> _onLoad(
//     SavedBusesLoadRequested event,
//     Emitter<SavedBusesState> emit,
//   ) async {
//     emit(SavedBusesLoading());
// //
//     final result = await _getSavedBuses();

//     // result.fold(
//     //   (failure) =>
//     //       emit(SavedBusesError(message: failure.message)),
//     //   (routes) =>
//     //       emit(SavedBusesLoaded(savedRoutes: routes)),
//     // );
//   }

//   Future<void> _onToggle(
//     SavedBusesToggleRequested event,
//     Emitter<SavedBusesState> emit,
//   ) async {
//     add(SavedBusesLoadRequested());
//   }
// }
