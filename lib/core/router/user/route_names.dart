// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:transit_track_flutter/core/router/user/user_route_name.dart';

// class RouteName {
//   final GoRouter userRouter = GoRouter(
//     initialLocation: UserRouteName.splash,
//     routes: [
//       GoRoute(path: UserRouteName.splash),
//        GoRoute(
//         path: UserRouteName.splash,
//         pageBuilder: (context, state) => slideNav(Splash()),
//       ),
//       GoRoute(
//         path: UserRouteName.login,
//         pageBuilder: (context, state) => slideNav(Login()),
//       ),
//       GoRoute(
//         path: UserRouteName.users
//         pageBuilder: (context, state) => slideNav(Dashboard()),
//       ),
//       GoRoute(
//         path: UserRouteName.,
//         pageBuilder: (context, state) => slideNav(Organaization()),
//       ),
//       GoRoute(
//         path: UserRouteName.fleet,
//         pageBuilder: (context, state) {
//           final data = state.extra as OrganaizationModel;
//           return slideNav(Fleet(data: data));
//         },
//       ),
//       GoRoute(
//         path: UserRouteName.routes,
//         pageBuilder: (context, state) => slideNav(Routes()),
//       ),
//       GoRoute(
//         path: UserRouteName.permit,
//         pageBuilder: (context, state) => slideNav(Permit()),
//       ),
//       GoRoute(
//         path: UserRouteName.users,
//         pageBuilder: (context, state) => slideNav(Users()),
//       ),

//     ],
//   );
// }
