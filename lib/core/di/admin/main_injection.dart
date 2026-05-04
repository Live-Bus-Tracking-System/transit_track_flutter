import 'package:shared_preferences/shared_preferences.dart';

import 'package:transit_track_flutter/core/di/admin/auth_di.dart';
import 'package:transit_track_flutter/core/di/admin/check_di.dart';
import 'package:transit_track_flutter/core/di/admin/dsh_di.dart';
import 'package:transit_track_flutter/core/di/admin/fleet_di.dart';
import 'package:transit_track_flutter/core/di/admin/org_di.dart';
import 'package:transit_track_flutter/core/di/admin/permit_di.dart';
import 'package:transit_track_flutter/core/network/dio_client_admin.dart';

class Injection {
  late final DioClientAdmin dio;
  late final SharedPreferences prefs;
  late final AuthDi auth;
  late final CheckDi check;
  late final OrgDi org;
  late final DshDi dsh;
  late final FleetDi fltDi;
  late final PermitDi permit;
  Future<void> initDi() async {
    prefs = await SharedPreferences.getInstance();
    dio = DioClientAdmin();
    org = OrgDi(dio);
    auth = AuthDi(dio, prefs);
    check = CheckDi(prefs);
    dsh = DshDi(dio);
    fltDi = FleetDi(dio);
    permit = PermitDi(dio);
  }
}
