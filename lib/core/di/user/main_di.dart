import 'package:transit_track_flutter/core/di/user/rout_di.dart';
import 'package:transit_track_flutter/core/network/dio_client_user.dart';

class InjectionUser {
  late final DioClientUser client;
  late final RoutDi di;
  Future<void> init() async {
    client=DioClientUser();
    await client.initDio();
    di = RoutDi(client);
  }
}
