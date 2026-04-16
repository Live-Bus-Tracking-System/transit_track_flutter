import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';


Widget publicRow(double Function(double) w, double Function(double) h) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.13),
        child: Row(
          children: [
            Container(
              width: w(0.03),
              height: h(0.075),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 221, 221),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Icon(Icons.directions_bus, color: Colors.red)),
            ),
            SizedBox(width: w(0.01)),
            SizedBox(
              width: w(0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BT-4022',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'Route 42:',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 103, 103),
                      fontSize: w(0.008),
                    ),
                  ),
                  Text(
                    'Downtown Express',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 103, 103),
                      fontSize: w(0.008),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        width: w(0.115),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Marcous',
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: w(0.01),
              ),
            ),
            Text(
              'Thorn',
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: w(0.01),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '89%',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 103, 103, 103),
                    fontSize: w(0.008),
                  ),
                ),
                SizedBox(width: w(0.056)),
                Text(
                  '22/100',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 103, 103, 103),
                    fontSize: w(0.008),
                  ),
                ),
              ],
            ),
            SizedBox(height: h(0.005)),
            Stack(
              children: [
                Container(
                  width: w(0.1),
                  height: h(0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 255, 225, 225),
                  ),
                ),
                Container(
                  width: w(0.09),
                  height: h(0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 255, 45, 45),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.073),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Central',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 81, 81, 81),
                fontWeight: FontWeight.w600,
                fontSize: w(0.01),
              ),
            ),
            Text(
              'Station',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.w600,
                fontSize: w(0.01),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.08),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.07),
            height: h(0.035),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 116, 47),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'On Sheduled',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 187, 255, 214),
                  fontSize: w(0.009),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
           SizedBox(width: w(0.00)),
      SizedBox(
        width: w(0.043),
        child: Text(
          'Central',
          style: GoogleFonts.poppins(
            color: AppTheme.color,
            fontWeight: FontWeight.w600,
            fontSize: w(0.01),
          ),
        ),
      ),
    ],
  );
}
