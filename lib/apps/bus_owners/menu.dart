import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/view/dashboard.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/add_bus.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/vehicles.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/profile_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/view/routes_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/snack_bar.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Menu extends StatefulWidget {
  final double Function(double) w;
  final double Function(double) h;
  const Menu({super.key, required this.h, required this.w});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetDpProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.logoutStatus == ProfileStatus.success) {
          orgSnackbar(context, 'Success', const Color.fromARGB(255, 0, 132, 4));
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        } else if (state.logoutStatus == ProfileStatus.error) {
          orgSnackbar(context, 'Failed', AppColors.red);
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
                      radius: widget.w(0.12),
                      backgroundColor: AppTheme.color,
                      child: CircleAvatar(
                        radius: widget.w(0.11),
                        backgroundColor: AppColors.bg,
                        child: BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state.getImageStatus == ProfileStatus.error ||
                                state.getImageStatus == ProfileStatus.loading ||
                                state.image == null) {
                              return CircleAvatar(
                                radius: widget.w(0.105),
                                child: Center(child: Icon(Icons.business)),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  204,
                                  204,
                                  204,
                                ),
                              );
                            }
                            return CircleAvatar(
                              radius: widget.w(0.105),
                              backgroundImage: FileImage(File(state.image!)),
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      'Admin',
                      style: GoogleFonts.poppins(
                        fontSize: widget.w(0.06),
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
                  size: widget.w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Dashboard",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
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
                  size: widget.w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Route",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
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
                  size: widget.w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Add Fleet",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
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
                  size: widget.w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Fleets",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
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
                  size: widget.w(0.06),
                  color: AppTheme.color,
                ),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  context.read<ProfileBloc>().add(LogoutOrgEvent());
                },
                leading: Icon(
                  Icons.logout,
                  size: widget.w(0.06),
                  color: Colors.red,
                ),
                title: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    fontSize: widget.w(0.05),
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
