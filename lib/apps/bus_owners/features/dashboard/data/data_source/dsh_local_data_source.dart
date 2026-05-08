import 'package:shared_preferences/shared_preferences.dart';

class DshLocalDataSource {
  final SharedPreferences prefs;
  DshLocalDataSource(this.prefs);

  String? getDpImage() {
    final id = prefs.getString('roleId');
    return prefs.getString('image$id');
  }
}
