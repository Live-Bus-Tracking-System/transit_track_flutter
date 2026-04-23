import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/core/di/bus_owner/main_di.dart';

import 'package:transit_track_flutter/core/di/user/main_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  final InjectionUser injectionUser = InjectionUser();
  final InjectionBusOwner injectionBusOwner = InjectionBusOwner();
  await injectionBusOwner.init();
  await injectionUser.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injectionUser.di.bloc()),
        BlocProvider(create: (context) => injectionBusOwner.auth.create()),
        BlocProvider(create: (context) => injectionBusOwner.fleet.create()),
        BlocProvider(create: (context) => injectionBusOwner.profile.create()),
      ],
      child: UserApp(),
    ),
  );
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
