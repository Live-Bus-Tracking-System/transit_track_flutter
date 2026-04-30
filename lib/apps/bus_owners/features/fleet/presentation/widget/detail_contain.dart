import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget detailCont(
  double Function(double) w,
  double h,
  Widget child, {
  Color bg = AppColors.white,
}) {
  return Align(
    alignment: AlignmentGeometry.center,
    child: Container(
      padding: EdgeInsets.all(w(0.07)),
      width: double.infinity,
      height: h,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 109, 109, 109).withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.1),
          //   blurRadius: 12,
          //   spreadRadius: 2,
          //   offset: Offset(0, 0), // ✅ equal shadow all sides
          // ),
        ],
      ),
      child: child,
    ),
  );
}

Widget catyPltCard(double Function(double) w, double Function(double) h) {
  return Container(
    width: w(0.3),
    height: h(0.04),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 216, 216, 216),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.wine_bar, size: w(0.05)),
          Text(
            'KL-32-24',
            style: GoogleFonts.inter(
              fontSize: w(0.035),
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget idCont(
 
  IconData icon,
  String text,
  double Function(double) w,
  double Function(double) h,
   {required String id}
) {
  return Column(
    children: [
      Row(
        children: [
          Icon(icon, size: w(0.04)),
          SizedBox(width: w(0.03)),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: w(0.035),
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 157, 63, 0),
            ),
          ),
        ],
      ),
      SizedBox(height: h(0.01)),
      Container(
        width: double.infinity,
        height: h(0.03),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: w(0.03),
            vertical: h(0.001),
          ),
          child: Text(
            '${id}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: w(0.033),
            ),
          ),
        ),
      ),
    ],
  );
}
