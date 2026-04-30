import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';

class AuthUserLocalDSource {
  static const String _userIdKey = '';
  static const String _userEmailKey = '';

  Future<void> cacheUserData(int id, String email) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(_userIdKey, id);
    await pref.setString(_userEmailKey, email);
  }

  static Future<int?> getCacheUserData() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(_userIdKey);
  }

  Future<void> clearData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
