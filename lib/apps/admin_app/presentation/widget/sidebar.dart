import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/sidebar_item.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    final page = GoRouterState.of(context).matchedLocation;
    return Container(
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
          sideBarItem(
            Icons.dashboard,
            'Dashboard',
            page == '/',
            () {
              context.go('/');
            },
            h,
            w,
          ),
          sideBarItem(
            Icons.build,
            'Organaization',
            page.startsWith('/organaizations'),
            () {
              context.go('/organaizations');
            },
            h,
            w,
          ),
          sideBarItem(
            Icons.public,
            'Public',
            page.startsWith('/public'),
            () {
              context.go('/public');
            },
            h,
            w,
          ),
          sideBarItem(
            Icons.route,
            'Routes',
            page.startsWith('/routes'),
            () {
              context.go('/routes');
            },
            h,
            w,
          ),
          sideBarItem(
            Icons.perm_identity,
            'Permit',
            page.startsWith('/permit'),
            () {
              context.go('/permit');
            },
            h,
            w,
          ),
          sideBarItem(
            Icons.person,
            'Users',
            page.startsWith('/users'),
            () {
              context.go('/users');
            },
            h,
            w,
          ),
        ],
      ),
    );
  }
}
