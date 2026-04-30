import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:transit_track_flutter/core/di/admin/main_injection.dart';
import 'package:transit_track_flutter/core/router/admin/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final Injection inject = Injection();
  await inject.initDi();
  final route = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject.auth.create()),
        BlocProvider(create: (context) => inject.check.create()),
        BlocProvider(create: (context) => inject.org.create()),
        BlocProvider(create: (context) => inject.dsh.create()),
        BlocProvider(create: (context) => inject.fltDi.create()),
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
