import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:transit_track_flutter/core/di/admin/main_injection.dart';
import 'package:transit_track_flutter/core/router/admin/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Injection inject = Injection();
  await inject.initDi();
  final route = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject.auth.bloc),
        BlocProvider(create: (context) => inject.check.bloc),
      ],
      child: AdminApp(router: route),
    ),
  );
}

class AdminApp extends StatelessWidget {
  final AppRouter router;
  const AdminApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: router.route,
    );
  }
}
