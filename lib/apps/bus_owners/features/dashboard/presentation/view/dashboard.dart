import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/dashboard/presentation/widget/map.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/view/profile_screen.dart';
import 'package:transit_track_flutter/apps/bus_owners/menu.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          ConstText.transitTrack,
          style: GoogleFonts.poppins(
            color: AppTheme.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            child: CircleAvatar(backgroundColor: AppColors.bg,radius: w(0.05),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
          ),
          SizedBox(width: w(0.04),)
        ],
      ),
      drawer: Menu(h: h, w: w),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: h(0.03)),
            feauturesCard('TOTAL FLEET UNITS', '124', w, h),
            SizedBox(height: h(0.03)),
            feauturesCard('ACTIVE DAILY ROUTES', '89', w, h),
            SizedBox(height: h(0.03)),
            feauturesCard('ON-DUTY DRIVERS', '178', w, h),
            SizedBox(height: h(0.03)),
            dshMap(w, h, context),
            SizedBox(height: h(0.03)),
            mainContain(
              w,
              double.infinity,
              h(0.32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'STATUS DISTRIBUTION',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.05),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: h(0.03)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ONLINE',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '108 UNITS',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 0, 140, 255),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: w(0.6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 140, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MAINTENANCE',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '22 UNITS',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: AppTheme.color,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: w(0.6),
                          decoration: BoxDecoration(
                            color: AppTheme.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'OFFLINE',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Text(
                        '22 UNITS',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: w(0.04),
                          color: const Color.fromARGB(255, 173, 173, 173),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: h(0.01),
                          width: w(0.6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 174, 174, 174),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: h(0.03)),
          ],
        ),
      ),
    );
  }
}
