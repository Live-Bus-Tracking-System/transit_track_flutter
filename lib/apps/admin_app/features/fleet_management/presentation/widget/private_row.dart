import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

Widget privateRow(double Function(double) w, double Function(double) h) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.09),
        child: Row(
          children: [
            SizedBox(
              width: w(0.032),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VT-8822',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'Electric Pivot',
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
        width: w(0.1),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: Colors.amber, radius: w(0.003)),
            SizedBox(width: w(0.006)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'North Star',
                  style: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: w(0.01),
                  ),
                ),
                Text(
                  '102',
                  style: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: w(0.01),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '42 km/h |',
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: w(0.01),
              ),
            ),
            Text(
              '12%',
              style: GoogleFonts.poppins(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: w(0.01),
              ),
            ),
            SizedBox(height: h(0.005)),
            Stack(
              children: [
                Container(
                  width: w(0.06),
                  height: h(0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 255, 225, 225),
                  ),
                ),
                Container(
                  width: w(0.04),
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
        width: w(0.07),
        child: Text(
          'Main Station West',
          style: GoogleFonts.poppins(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: w(0.012),
          ),
        ),
      ),
      SizedBox(width: w(0.03),),
      SizedBox(
        width: w(0.05),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.06),
            height: h(0.045),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 116, 47),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                'On Time',
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
     
    
    ],
  );
}
