import 'package:transit_track_flutter/apps/admin_app/features/permit/data/data_source/permit_remote_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/data/repository/permit_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/usecases/get_all_pending_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/domain/usecases/saerch_pending_use_case.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/presentation/bloc/permit_bloc.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class PermitDi {
  final DioClientAdmin client;
  PermitDi(this.client);

  PermitBloc create() {
    final source = PermitRemoteDataSource(client);
    final repo = PermitImpl(source);
    return PermitBloc(GetAllPendingUseCase(repo), SaerchPendingUseCase(repo));
  }
}
