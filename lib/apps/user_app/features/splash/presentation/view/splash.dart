import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/view/home.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/bloc/splash_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/landing.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class UserSplash extends StatefulWidget {
  const UserSplash({super.key});

  @override
  State<UserSplash> createState() => _UserSplashState();
}

class _UserSplashState extends State<UserSplash> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBlocBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppTheme.color,
      body: BlocConsumer<SplashBlocBloc, SplashBlocState>(
        listener: (context, state) {
          if (state is NavigateAdmin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DashboardScreen()),
            );
          } else if (state is NavigateUser) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          } else if (state is NavigateNewUser) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Landing()),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  Icons.directions_bus,
                  size: w(0.14),
                  color: AppColors.white,
                ),
                SizedBox(height: h(0.02)),
                Text(
                  "TransitTrack",
                  style: TextStyle(
                    color: AppTheme.colors,
                    fontSize: w(0.08),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
