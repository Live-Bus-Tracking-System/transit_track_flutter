import 'package:transit_track_flutter/apps/admin_app/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future<String> login(AuthModel model);
  Future<void> setLogged(bool isLogged); 
  Future<String> logout(bool isLogged);
}