import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/auth_string.dart';

class LocalDataSource {
  final SharedPreferences prefs;
  LocalDataSource(this.prefs);

  Future<bool> get() async {
    debugPrint('this is check getted ${prefs.getBool('isL')}');
    return prefs.getBool('isL') ?? false;
  }
}
