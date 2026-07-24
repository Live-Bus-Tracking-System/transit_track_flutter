
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/core/di/user/auth_di.dart';
import 'package:transit_track_flutter/core/di/user/home_di.dart';
import 'package:transit_track_flutter/core/di/user/landing_di.dart';
import 'package:transit_track_flutter/core/di/user/profile_di.dart';
import 'package:transit_track_flutter/core/di/user/route_di.dart';
import 'package:transit_track_flutter/core/di/user/save_di.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class InjectionUser {
  late final DioClientUser client;
  late final SharedPreferences prefs;
  late final AuthDi auth;
  late final LandingDi landing;
  late final HomeDi home;
  late final ProfileDi profile;
  late final RouteDi route;
  late final SaveDi save;
  Future<void> init() async {
    prefs=await SharedPreferences.getInstance();
    client=DioClientUser();
    await client.initDio();
    auth=AuthDi(client,prefs);
    landing=LandingDi(prefs);
    home=HomeDi();
    profile=ProfileDi();
    route=RouteDi();
    save=SaveDi();
  }
}
