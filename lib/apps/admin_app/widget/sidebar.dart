import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transit_track_flutter/apps/admin_app/features/auth/presentation/bloc/auth_admin_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar_item.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/snack_bar.dart';
import 'package:transit_track_flutter/core/constants/strings/auth_string.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  Future<void> setB() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AuthString.isLogged, false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;

    final local = GoRouterState.of(context).matchedLocation;
    return BlocListener<AuthAdminBloc, AuthAdminState>(
      listener: (context, state) {
        if (state.status == AuthAdminStatus.loading) {
          CircularProgressIndicator();
        } else if (state.status == AuthAdminStatus.error) {
          showSnackbar(context, state.error!, Colors.red);
        } else if (state.status == AuthAdminStatus.success) {
          showSnackbar(
            context,
            'Success',
            const Color.fromARGB(255, 28, 154, 0),
          );
          context.go('/login');
        }
      },
      child: Container(
        width: w(0.2),
        color: AppColors.ltOrange,
        child: Column(
          children: [
            SizedBox(height: h(0.03)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      width: w(0.038),
                      height: h(0.078),
                      decoration: BoxDecoration(
                        color: AppTheme.color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/bus-removebg-preview.png',
                          width: w(0.02),
                        ),
                      ),
                    ),
                    SizedBox(width: w(0.01)),
                    Column(
                      children: [
                        Text(
                          'TransitTrack',
                          style: GoogleFonts.poppins(
                            fontSize: w(0.013),
                            fontWeight: FontWeight.bold,
                            color: AppTheme.color,
                          ),
                        ),
                        Text(
                          'ADMIN PANEL',
                          style: TextStyle(
                            fontSize: w(0.01),
                            color: const Color.fromARGB(255, 123, 123, 123),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: h(0.04)),
            Expanded(
              child: ListView(
                children: [
                  sideBarItem(
                    Icons.dashboard,
                    'Dashboard',
                    local == '/dashboard',
                    () {
                      context.go('/dashboard');
                    },
                    h,
                    w,
                  ),
                  sideBarItem(
                    Icons.business,
                    'Organaization',
                    local == '/organaizations',

                    () {
                      context.go('/organaizations');
                    },
                    h,
                    w,
                  ),
                  sideBarItem(
                    Icons.directions_bus,
                    'Fleet',
                    local == '/fleet',

                    () {
                      context.go('/fleet');
                    },
                    h,
                    w,
                  ),
                  sideBarItem(
                    Icons.route,
                    'Routes',
                    local == '/routes',

                    () {
                      context.go('/routes');
                    },
                    h,
                    w,
                  ),
                  sideBarItem(
                    Icons.verified_user,
                    'Permit',
                    local == '/permit',

                    () {
                      context.go('/permit');
                    },
                    h,
                    w,
                  ),
                  sideBarItem(
                    Icons.person,
                    'Users',
                    local == '/users',

                    () {
                      context.go('/users');
                    },
                    h,
                    w,
                  ),
                  SizedBox(height: h(0.3)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () async {
                        await setB();
                        context.read<AuthAdminBloc>().add(LogoutAuthAdminEvent());
                      },
                      leading: Icon(Icons.logout, color: Colors.red, weight: 2),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: w(0.012),
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
