import 'package:shared_preferences/shared_preferences.dart';

class FleetLocalDataSource {
  final SharedPreferences prefs;
  FleetLocalDataSource(this.prefs);

  String getId() {
    return prefs.getString('orgId') ?? '';
  }
}
