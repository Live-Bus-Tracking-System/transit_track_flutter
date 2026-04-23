import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSorce {
  final SharedPreferences prefs;
  ProfileLocalDataSorce(this.prefs);

 Future<void> setId(String id)async{
  await prefs.setString('orgId',id);
 }

  String getId(){
    return prefs.getString('orgId')??'';
  }
}