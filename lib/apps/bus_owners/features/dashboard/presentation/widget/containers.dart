import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget feauturesCard(String title,String count, double Function(double) w, double Function(double) h) {
  return mainContain(
    w,
    double.infinity,
    h(0.17),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: w(0.05),
            color: AppTheme.color,
          ),
        ),
        Text(
          count,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: w(0.1),
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                height: h(0.008),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 214, 214),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: h(0.008),
                width: w(0.6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 143, 57, 0),
                      AppTheme.color,
                    ],
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentGeometry.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
