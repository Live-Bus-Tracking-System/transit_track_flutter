import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/over_view_vehicle.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/landing.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/splash.dart';
import 'package:transit_track_flutter/apps/user_app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/di/bus_owner/main_di.dart';

import 'package:transit_track_flutter/core/di/user/main_di.dart';
import 'package:transit_track_flutter/core/utils/app_scrollbehavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final InjectionUser injectionUser = InjectionUser();
  final InjectionBusOwner injectionBusOwner = InjectionBusOwner();
  await injectionBusOwner.init();
  await injectionUser.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => injectionUser.auth.create()),
        BlocProvider(create: (context) => injectionUser.landing.create()),
        BlocProvider(create: (context) => injectionBusOwner.auth.create()),
        BlocProvider(create: (context) => injectionBusOwner.fleet.create()),
        BlocProvider(create: (context) => injectionBusOwner.profile.create()),
        BlocProvider(create: (context) => injectionBusOwner.route.create()),
        BlocProvider(create: (context) => injectionBusOwner.dsh.create()),
        BlocProvider(create: (context) => injectionUser.home.create()),
        BlocProvider(create: (context) => injectionUser.route.create()),
        BlocProvider(create: (context) => injectionUser.profile.create()),
        BlocProvider(create: (context) => injectionUser.save.create()),
      ],
      child: UserApp(),
    ),
  );
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: MaterialScrollBehavior().copyWith(
            physics: BouncingScrollPhysics(),
          ),
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.mode,
          home: UserSplash(),
        );
      },
    );
  }
}
