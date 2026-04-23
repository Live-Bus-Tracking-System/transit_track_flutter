import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/data/model/bus_owners_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/usecases/create_bus_owner_use_case.dart';

part 'bus_owner_auth_event.dart';
part 'bus_owner_auth_state.dart';

class BusOwnerAuthBloc extends Bloc<BusOwnerAuthEvent, BusOwnerAuthState> {
  final CreateBusOwnerUseCase create;
  BusOwnerAuthBloc(this.create) : super(BusOwnerAuthInitial()) {
    on<CreateBusOwnerEvent>((event, emit) async {
      emit(BusOwnerAuthLoading());
      final result = await create.call(
        BusOwnersModel(
          name: event.name,
          email: event.email,
          phone: event.phone,
          type: event.type,
        ),
      );
      result.fold(
        (error) => emit(BusOwnerAuthError(error.message)),
        (data) => emit(BusOwnerAuthSuccess()),
      );
    });
  }
}
