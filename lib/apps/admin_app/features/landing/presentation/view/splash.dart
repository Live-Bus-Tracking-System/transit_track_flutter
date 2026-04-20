import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<bool> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AuthString.isLogged) ?? false;
  }

  @override
  void initState() {
    context.read<CheckstateBloc>().add(CheckAuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: get(),
    //   builder: (context, snapshot) {
    //     debugPrint('${snapshot.data}');
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Scaffold(
    //         backgroundColor: AppTheme.color,
    //         body: Center(child: CircularProgressIndicator(color: Colors.white)),
    //       );
    //     } else if (snapshot.data == true) {
    //       return Dashboard();
    //     } else {
    //       return Login();
    //     }
    //   },
    // );

    return BlocListener<CheckstateBloc, CheckstateState>(
      listener: (context, state) {
        if (state is CheckstateSuccess) {
          context.go('/dashboard');
        } else if (state is CheckstateError) {
          context.go('/dashboard');
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.color,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
