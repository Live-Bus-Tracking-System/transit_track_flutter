import 'package:shared_preferences/shared_preferences.dart';

class BusOwnerLocalDataSource {
  final SharedPreferences prefs;
  BusOwnerLocalDataSource(this.prefs);

  Future<void> setId(String id) async {
    await prefs.setString('orgId', id);
  }

  Future<void> deleteId() async {
    await prefs.remove('orgId');
  }
}
