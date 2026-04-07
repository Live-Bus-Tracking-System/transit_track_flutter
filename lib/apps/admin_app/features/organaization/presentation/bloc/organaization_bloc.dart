import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'organaization_event.dart';
part 'organaization_state.dart';

class OrganaizationBloc extends Bloc<OrganaizationEvent, OrganaizationState> {
  OrganaizationBloc() : super(OrganaizationInitial()) {
    on<OrganaizationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
