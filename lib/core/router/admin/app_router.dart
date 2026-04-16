import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/view/fleet.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/view/splash.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/view/organaization.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/presentation/view/permit.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/view/route.dart';
import 'package:transit_track_flutter/apps/admin_app/features/users/presentation/view/users.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/animation.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/core/router/admin/route_names.dart';

class AppRouter {
  final GoRouter route = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        pageBuilder: (context, state) => slideNav(Splash()),
      ),
      GoRoute(
        path: RouteNames.login,
        pageBuilder: (context, state) => slideNav(Login()),
      ),
      GoRoute(
        path: RouteNames.dashboard,
        pageBuilder: (context, state) => slideNav(Dashboard()),
      ),
      GoRoute(
        path: RouteNames.organaizations,
        pageBuilder: (context, state) => slideNav(Organaization()),
      ),
      GoRoute(
        path: RouteNames.fleet,
        pageBuilder: (context, state) => slideNav(Fleet()),
      ),
      GoRoute(
        path: RouteNames.routes,
        pageBuilder: (context, state) => slideNav(Routes()),
      ),
      GoRoute(
        path: RouteNames.permit,
        pageBuilder: (context, state) => slideNav(Permit()),
      ),
      GoRoute(
        path: RouteNames.users,
        pageBuilder: (context, state) => slideNav(Users()),
      ),
    ],
  );
}
