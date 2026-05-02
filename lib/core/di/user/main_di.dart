import 'package:transit_track_flutter/core/di/bus_owner/rout_di.dart';
import 'package:transit_track_flutter/core/di/user/auth_di.dart';
import 'package:transit_track_flutter/core/di/user/home_di.dart';
import 'package:transit_track_flutter/core/di/user/splash_di.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class InjectionUser {
  late final DioClientUser client;
  late final AuthDi auth;
  late final SplashDi splash;
  late final HomeDi home;
  Future<void> init() async {
    client = DioClientUser();
    await client.initDio();
    auth = AuthDi(client);
    splash = SplashDi();
    home = HomeDi(client);
  }
}
