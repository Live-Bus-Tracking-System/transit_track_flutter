
import 'package:hive/hive.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';

class AuthLocalDataSource {
  final Box<bool> hive;
  AuthLocalDataSource(this.hive);

  Future<void> set(bool isLogged) async {
    await hive.put(AuthString.isLogged, isLogged);
  }
}
