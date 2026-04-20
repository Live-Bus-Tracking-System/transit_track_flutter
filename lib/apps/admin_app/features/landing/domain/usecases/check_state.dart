import 'package:transit_track_flutter/apps/admin_app/features/landing/domain/repository/check_state.dart';

class CheckStateCase {
  final CheckStateRepo repo;
  CheckStateCase(this.repo);

 Future<bool> call()async {
    return await repo.getState();
  }
}
