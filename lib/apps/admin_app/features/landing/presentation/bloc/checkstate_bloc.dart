import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/usecases/check_state.dart';

part 'checkstate_event.dart';
part 'checkstate_state.dart';

class CheckstateBloc extends Bloc<CheckstateEvent, CheckstateState> {
  final CheckStateCase check;
  CheckstateBloc(this.check) : super(CheckstateInitial()) {
    on<CheckAuthEvent>((event, emit) async {
  

      emit(CheckstateLoading());
      final data = await check.call();
    
      if (data) {
        emit(CheckstateSuccess());
      } else {
        emit(CheckstateError());
      }
    });
  }
}
