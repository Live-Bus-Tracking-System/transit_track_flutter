import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSorce {
  final SharedPreferences prefs;
  ProfileLocalDataSorce(this.prefs);

  Future<void> setId(String id) async {
    await prefs.setString('roleId', id);
  }

  String getId() {
    return prefs.getString('roleId') ?? '';
  }

  Future<void> deleteRoleLoggedId() async {
    await prefs.remove('roleId');
    await prefs.remove('isLoggin');
    await prefs.remove('role');
  }

  Future<void> setDpImage(String image, String id) async {
    await prefs.setString('image$id', image);
  }

  String? getDpImage(String id) {
    return prefs.getString('image$id');
  }
}
