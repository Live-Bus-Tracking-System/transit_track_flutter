import 'package:shared_preferences/shared_preferences.dart';

class SplashLocalDataSource {
  final SharedPreferences prefs;

  SplashLocalDataSource(this.prefs);

  Map<String, dynamic> getRoleLogged() {
    final role = prefs.getString('role') ?? '';
    final logged = prefs.getBool('isLoggin') ?? false;
    print('${logged}');
    return {'role': role, 'logged': logged};
  }
}
