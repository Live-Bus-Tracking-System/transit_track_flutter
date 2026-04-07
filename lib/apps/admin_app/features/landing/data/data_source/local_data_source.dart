import 'package:hive/hive.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';

class LocalDataSource {
  final Box<bool> hive;
  LocalDataSource(this.hive);

  Future<bool> get() async {
    return hive.get(AuthString.isLogged) ?? false;
  }
}
