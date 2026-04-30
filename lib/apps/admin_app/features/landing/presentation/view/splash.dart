import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/admin_app/features/landing/presentation/bloc/checkstate_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/auth_string.dart';
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
    context.read<OrganaizationBloc>().add(GetAllOrgEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrganaizationBloc, OrganaizationState>(
      listener: (context, state) {
        debugPrint('${state.getStatus}${state.error}');
        if (state.getStatus == OrgStatus.success) {
          context.go('/dashboard');
        } else if (state.getStatus == OrgStatus.error) {
          context.go('/login');
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.color,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
