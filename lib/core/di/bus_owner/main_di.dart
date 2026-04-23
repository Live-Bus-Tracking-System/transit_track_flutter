import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/core/di/bus_owner/auth_di.dart';
import 'package:transit_track_flutter/core/di/bus_owner/fleet_di.dart';
import 'package:transit_track_flutter/core/di/bus_owner/profile_di.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

class InjectionBusOwner {
  late final DioClient client;
  late final SharedPreferences prefs;
  late final AuthDi auth;
  late final FleetDi fleet;
  late final ProfileDi profile;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    client = DioClient();
    profile = ProfileDi(client, prefs);

    auth = AuthDi(client);
    fleet = FleetDi(client);
  }
}
