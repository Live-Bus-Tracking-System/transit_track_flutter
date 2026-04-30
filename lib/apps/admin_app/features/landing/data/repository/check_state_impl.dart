import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/data/data_source/local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/repository/check_state.dart';

class CheckStateImpl extends CheckStateRepo {
  final LocalDataSource source;
  CheckStateImpl(this.source);
  @override
 Future<bool> getState() async {
    return await source.get();
  }
}
