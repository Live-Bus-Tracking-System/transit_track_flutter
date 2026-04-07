import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/usecases/check_state.dart';

part 'checkstate_event.dart';
part 'checkstate_state.dart';

class CheckstateBloc extends Bloc<CheckstateEvent, CheckstateState> {
  final CheckStateCase check;
  CheckstateBloc(this.check) : super(CheckstateInitial()) {
    on<GetStateEvent>((event, emit) async {
      emit(CheckstateLoading());
      final data = await check.call();
      debugPrint('$data');
      if (data) {
        emit(CheckstateSuccess());
      } else {
        emit(CheckstateError());
      }
    });
  }
}
