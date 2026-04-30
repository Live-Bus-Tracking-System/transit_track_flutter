import 'package:transit_track_flutter/core/di/user/rout_di.dart';

class InjectionUser {
  late final RoutDi di;
  Future<void> init() async {
    di = RoutDi();
  }
}
