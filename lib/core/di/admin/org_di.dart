import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/data_source/org_remote_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/repository/organaization_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/activate_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/delete_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/fleet_count_id_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/get_all_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/domain/usecases/suspend_org_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class OrgDi {
  final DioClient dio;
  OrgDi(this.dio);
  OrganaizationBloc create() {
    final orgLocal = OrgRemoteLocalDataSource(dio);
    final orgRepo = OrganaizationImpl(orgLocal);
    return OrganaizationBloc(
      GetAllUseCase(orgRepo),
      ActivateOrgUseCase(orgRepo),
      SuspendOrgUseCase(orgRepo),
      DeleteOrgUseCase(orgRepo),
      FleetCountIdUseCase(orgRepo)
    );
  }
}
