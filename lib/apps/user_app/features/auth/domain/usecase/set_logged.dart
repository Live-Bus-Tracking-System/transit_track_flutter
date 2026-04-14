import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';

class SetLogged {
  final AuthRepo res;
  SetLogged(this.res);

  Future<void> call (bool isLogged)async{
    return await res.setLogged(isLogged);
  }
}