import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/data_source/admin_dsh_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/data/repository/admin_dashboard_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/domain/usecases/get_all_service_counts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/bloc/admin_dsh_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class DshDi {
  final DioClientAdmin client;
  DshDi(this.client);

  AdminDshBloc create() {
    final remote = AdminDshRemoteDataSource(client);
    final repo = AdminDashboardImpl(remote);
    return AdminDshBloc(GetAllCountsUseCase(repo));
  }
}
