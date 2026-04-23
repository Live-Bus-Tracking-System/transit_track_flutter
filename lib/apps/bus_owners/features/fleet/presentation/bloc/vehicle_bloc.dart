import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/domain/usecases/create_bus_owner_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/create_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/upload_file_use_case.dart';
import 'package:transit_track_flutter/core/services/pick_file.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final CreateVehicleUseCase create;
  final UploadFileUseCase upload;
  VehicleBloc(this.create, this.upload) : super(VehicleState()) {
    on<CreateVehicleEvent>((event, emit) async {
      emit(state.copyWithin(createStatus: VehicleStatus.loading));
      final result = await create.call(
        VehicleModel(
          name: event.name,
          trackerId: event.trackerId,
          capacity: event.capacity,
          licensePlt: event.licensePlt,
          registrationCertificateUrl: event.registrationCertificateUrl,
          registrationCertificateNo: event.registrationCertificateNo,
          registrationCertIssuedBy: event.registrationCertIssuedBy,
          registrationCertIssuedAt: event.registrationCertIssuedAt,
          registrationCertExpiresAt: event.registrationCertExpiresAt,
          permitCertificateUrl: event.permitCertificateUrl,
          permitCertificateNo: event.permitCertificateUrl,
          permitCertIssuedBy: event.permitCertIssuedBy,
          permitCertIssuedAt: event.permitCertIssuedAt,
          permitCertExpiresAt: event.permitCertExpiresAt,
          startStopName: event.startStopName,
          endStopName: event.endStopName,
          routeName: event.routeName,
          additionalNotes: event.additionalNotes,
        ),
      );
      result.fold(
        (error) => emit(
          state.copyWithin(
            createStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(state.copyWithin(createStatus: VehicleStatus.success)),
      );
    });

    on<UploadPermitFileEvent>((event, emit) async {
      emit(state.copyWithin(uploadRgStatus: VehicleStatus.loading));
      final file = await pickFile();
      if (file == null) {
        emit(
          state.copyWithin(
            uploadRgStatus: VehicleStatus.error,
            error: 'Failed',
          ),
        );
        return;
      }

      final result = await upload.call(file);
      result.fold(
        (error) => emit(
          state.copyWithin(
            uploadRgStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(uploadRgStatus: VehicleStatus.success, url: data),
        ),
      );
    });
    on<UploadRegistartionFileEvent>((event, emit) async {
      emit(state.copyWithin(uploadPtStatus: VehicleStatus.loading));
      final file = await pickFile();
      if (file == null) {
        emit(
          state.copyWithin(
            uploadPtStatus: VehicleStatus.error,
            error: 'Failed',
          ),
        );
        return;
      }

      final result = await upload.call(file);
      result.fold(
        (error) => emit(
          state.copyWithin(
            uploadPtStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(uploadPtStatus: VehicleStatus.success, url: data),
        ),
      );
    });
  }
}
