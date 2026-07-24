import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(mode: ThemeMode.dark)) {
    on<ThemeEvent>((event, emit) {
      emit(
        ThemeState(
          mode: state.mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
        ),
      );
    });
  }
}
