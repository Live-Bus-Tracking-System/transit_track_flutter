import 'package:bloc/bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/activate_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/create_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/deactivate_vehicle_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/delete_vehcile_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/edit_vehcile_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/get_all_fleets_use_case.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/domain/usecases/upload_file_use_case.dart';
import 'package:transit_track_flutter/core/services/pick_file.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final CreateVehicleUseCase create;
  final UploadFileUseCase upload;
  final GetAllFleetsUseCase fleets;
  final EditVehcileUseCase edit;
  final DeleteVehcileUseCase delete;
  final ActivateVehicleUseCase activate;
  final DeactivateVehicleUseCase deactivate;
  VehicleBloc(
    this.create,
    this.upload,
    this.fleets,
    this.edit,
    this.delete,
    this.activate,
    this.deactivate,
  ) : super(VehicleState()) {
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

      final result = await upload.call(
        file: file,
        progress: (p0, p1) {},
        onLong: (p0) {},
      );
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

      final result = await upload.call(
        file: file,
        progress: (p0, p1) {},
        onLong: (p0) {},
      );
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

    on<GetAllFleetEvent>((event, emit) async {
      emit(state.copyWithin(getAllStatus: VehicleStatus.loading));

      final result = await fleets.call();
      result.fold(
        (error) => emit(
          state.copyWithin(
            getAllStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(getAllStatus: VehicleStatus.success, datas: data),
        ),
      );
    });

    on<EditVehicleEvent>((event, emit) async {
      emit(state.copyWithin(editStatus: VehicleStatus.loading));
      final result = await edit.call(
        event.id,
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
            editStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(editStatus: VehicleStatus.success, message: data),
        ),
      );
    });

    on<DeleteVehicleEvent>((event, emit) async {
      emit(state.copyWithin(dltStatus: VehicleStatus.loading));

      final result = await delete.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            dltStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(dltStatus: VehicleStatus.success, message: data),
        ),
      );
    });

    on<ActivateVehicleEvent>((event, emit) async {
      emit(state.copyWithin(activateStatus: VehicleStatus.loading));

      final result = await activate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            activateStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(
            activateStatus: VehicleStatus.success,
            message: data,
          ),
        ),
      );
    });

    on<DeActivateVehicleEvent>((event, emit) async {
      emit(state.copyWithin(deActStatus: VehicleStatus.loading));

      final result = await deactivate.call(event.id);
      result.fold(
        (error) => emit(
          state.copyWithin(
            deActStatus: VehicleStatus.error,
            error: error.message,
          ),
        ),
        (data) => emit(
          state.copyWithin(deActStatus: VehicleStatus.success, message: data),
        ),
      );
    });
  }
}
