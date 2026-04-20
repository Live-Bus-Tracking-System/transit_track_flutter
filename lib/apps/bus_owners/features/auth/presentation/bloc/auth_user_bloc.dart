import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  AuthUserBloc() : super(AuthUserInitial()) {
    on<AuthUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
