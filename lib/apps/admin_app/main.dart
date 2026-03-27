import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/organaization.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/permit.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/fleet.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/route.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/layout/users.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/organaizations': (context) => Organaization(),
        '/public': (context) => Fleet(),
        '/routes': (context) => Routes(),
        '/permit': (context) => Permit(),
        '/users': (context) => Users(),
      },
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: GoRouter(
    //     routes: [
    //       GoRoute(
    //         path: '/',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: const Dashboard(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/organaizations',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: Organaization(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/public',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: const Public(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/routes',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: Routes(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/permit',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: const Permit(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/users',
    //         pageBuilder: (context, state) => CustomTransitionPage(
    //           transitionDuration: const Duration(milliseconds: 300),
    //           child: const Users(),
    //           transitionsBuilder:
    //               (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(opacity: animation, child: child);
    //               },
    //         ),
    //       ),
    //       // GoRoute(path: '/organaizations', builder: (context, state) => Organaization())
    //     ],
    //   ),
    // );
  }
}
