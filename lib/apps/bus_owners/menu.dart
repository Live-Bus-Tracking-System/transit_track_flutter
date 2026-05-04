import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/add_bus.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/vehicles.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/profile_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/view/routes_screen.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Menu extends StatelessWidget {
  final double Function(double) w;
  final double Function(double) h;
  const Menu({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.logoutStatus == ProfileStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 31, 145, 0),
              content: Text(
                '${state.message}',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
          );
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        } else if (state.logoutStatus == ProfileStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 180, 0, 0),
              content: Text(
                '${state.error}',
                style: GoogleFonts.poppins(color: AppColors.white),
              ),
            ),
          );
        }
      },
      child: Drawer(
        backgroundColor: AppColors.bg,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: w(0.12),
                      backgroundColor: AppTheme.color,
                      child: CircleAvatar(
                        radius: w(0.11),
                        backgroundColor: AppColors.bg,
                        child: CircleAvatar(
                          radius: w(0.105),
                          backgroundColor: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Admin',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.06),
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  );
                },
                leading: Icon(
                  Icons.dashboard,
                  size: w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Dashboard",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RoutesScreen()),
                  );
                },
                leading: Icon(
                  Icons.route,
                  size: w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Route",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Fleet()),
                  );
                },
                leading: Icon(
                  Icons.directions_bus,
                  size: w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Add Fleet",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const VehiclesPage()),
                  );
                },
                leading: Icon(
                  Icons.directions_bus,
                  size: w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Fleets",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                },
                leading: Icon(
                  Icons.person,
                  size: w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  context.read<ProfileBloc>().add(LogoutOrgEvent());
                },
                leading: Icon(Icons.logout, size: w(0.06), color: Colors.red),
                title: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
