import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    context.read<CheckstateBloc>().add(GetStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckstateBloc, CheckstateState>(
      builder: (context, state) {
        if (state is CheckstateLoading) {
          return Scaffold(
            backgroundColor: AppTheme.color,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        } else if (state is CheckstateSuccess) {
          return Dashboard();
        } else {
          return Login();
        }
      },
    );
  }
}
