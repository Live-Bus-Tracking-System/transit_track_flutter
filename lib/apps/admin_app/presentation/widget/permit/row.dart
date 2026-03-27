import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/common/text.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

Widget permitRow(double Function(double) w, double Function(double) h) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VH-',
              style: GoogleFonts.poppins(
                fontSize: w(0.012),
                fontWeight: FontWeight.w600,
                color: AppTheme.color,
              ),
            ),
            Text(
              '9920-X',
              style: GoogleFonts.poppins(
                fontSize: w(0.012),
                fontWeight: FontWeight.w600,
                color: AppTheme.color,
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        width: w(0.06),
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: w(0.014),
              color: const Color.fromARGB(255, 53, 53, 53),
            ),
            head3('Driver', w(0.012)),
          ],
        ),
      ),
      SizedBox(width: w(0.1), child: head3('Metro Transit Hub', w(0.012))),
      SizedBox(width: w(0.05), child: head3('Oct 12,2025', w(0.011))),
      SizedBox(
        width: w(0.115),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.06),
            height: h(0.04),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 233, 233),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Expired',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 184, 28, 28),
                  fontSize: w(0.009),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: w(0.09),
        child: Container(
          width: w(0.7),
          height: 30,
          decoration: BoxDecoration(
            color: AppTheme.color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              'Request Renewal',
              style: GoogleFonts.poppins(
                fontSize: w(0.009),
                color: AppColors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
