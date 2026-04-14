import 'package:transit_track_flutter/core/di/user/rout_di.dart';

class Injection {
  late final RoutDi di;
  Future<void> init() async {
    di = RoutDi();
  }
}
