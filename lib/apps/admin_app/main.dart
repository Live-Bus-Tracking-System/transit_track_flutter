import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/datasource/remote_localdata_source.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/repository/auth_repo.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/login_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/domain/usecases/logout_admin.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/view/splash.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/view/organaization.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/presentation/view/permit.dart';

import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/view/fleet.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/view/route.dart';
import 'package:transit_track_flutter/apps/admin_app/features/users/presentation/view/users.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/animation.dart';
import 'package:transit_track_flutter/core/di/admin/injection.dart';
import 'package:transit_track_flutter/core/network/dio_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Injection inject = Injection();
  await inject.initDi();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject.authBl),
        BlocProvider(create: (context) => inject.checkBl),
      ],
      child: AdminApp(),
    ),
  );
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return slideNav(Splash());
            },
          ),
           GoRoute(
            path: '/login',
            pageBuilder: (context, state) => slideNav(Login()),
          ),
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => slideNav(Dashboard()),
          ),
          GoRoute(
            path: '/organaizations',
            pageBuilder: (context, state) => slideNav(Organaization()),
          ),
          GoRoute(
            path: '/fleet',
            pageBuilder: (context, state) => slideNav(Fleet()),
          ),
          GoRoute(
            path: '/routes',
            pageBuilder: (context, state) => slideNav(Routes()),
          ),
          GoRoute(
            path: '/permit',
            pageBuilder: (context, state) => slideNav(Permit()),
          ),
          GoRoute(
            path: '/users',
            pageBuilder: (context, state) => slideNav(Users()),
          ),
        ],
      ),
    );
  }
}
