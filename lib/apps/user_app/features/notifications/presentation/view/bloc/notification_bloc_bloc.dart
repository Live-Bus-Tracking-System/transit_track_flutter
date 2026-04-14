import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_bloc_event.dart';
part 'notification_bloc_state.dart';

class NotificationBlocBloc extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  NotificationBlocBloc() : super(NotificationBlocInitial()) {
    on<NotificationBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
