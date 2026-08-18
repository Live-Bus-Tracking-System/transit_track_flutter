import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/bloc/auth_bloc_bloc.dart';

class AuthUserLocalDSource {
  final SharedPreferences prefs;
  AuthUserLocalDSource(this.prefs);
  static const String _userIdKey = '';
  static const String _userEmailKey = '';
  Future<void> setId(String id) async {
    await prefs.setString('roleId', id);
  }

  Future<void> setRole(String role) async {
    await prefs.setString('role', role);
    await prefs.setBool('isLoggin',true);
  }


  Future<void> deleteId() async {
    await prefs.remove('roleId');
  }

  // Future<void> cacheUserData(int id, String email) async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.setInt(_userIdKey, id);
  //   await pref.setString(_userEmailKey, email);
  // }

  Future<int?> getCacheUserData() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(_userIdKey);
  }

  Future<void> clearData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
