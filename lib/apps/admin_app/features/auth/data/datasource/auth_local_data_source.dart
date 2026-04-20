import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';

class AuthAdminLocalDataSource {
  final SharedPreferences prefs;
  AuthAdminLocalDataSource(this.prefs);

  Future<void> set(bool isLogged) async {

    await prefs.setBool(AuthString.isLogged, isLogged);
    debugPrint(' this is login setted${prefs.getBool(AuthString.isLogged)}');
  }

}
