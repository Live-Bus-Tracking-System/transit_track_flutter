import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';

Widget logHead1(String text, double Function(double) w) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: w(0.018),
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
  );
}

Widget loghead3(String text,double Function(double) w) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: w(0.01),
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 93, 93, 93),
    ),
  );
}
