import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/core/di/bus_owner/auth_di.dart';
import 'package:transit_track_flutter/core/di/bus_owner/fleet_di.dart';
import 'package:transit_track_flutter/core/di/bus_owner/profile_di.dart';
import 'package:transit_track_flutter/core/di/bus_owner/rout_di.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class InjectionBusOwner {
  late final DioClientUser client;
  late final SharedPreferences prefs;
  late final AuthDi auth;
  late final FleetDi fleet;
  late final ProfileDi profile;
  late final RoutDi route;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    client = DioClientUser();
    await client.initDio();
    profile = ProfileDi(client, prefs);
    route = RoutDi(client);
    auth = AuthDi(client, prefs);
    fleet = FleetDi(client, prefs);
  }
}
