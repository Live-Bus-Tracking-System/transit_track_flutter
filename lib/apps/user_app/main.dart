import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/auth/presentation/view/signup_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/add_bus.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/profile_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/view/routes_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/view/way_point.dart';
import 'package:transit_track_flutter/apps/user_app/features/bottom/view/bottom_bar.dart';
import 'package:transit_track_flutter/apps/user_app/features/landing/presentation/view/landing.dart';
import 'package:transit_track_flutter/core/constants/strings/api_constants.dart';
import 'package:transit_track_flutter/core/di/user/main_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final Injection injection = Injection();
  await injection.init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => injection.di.bloc())],
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
      home: const Fleet(),
    );
  }
}
