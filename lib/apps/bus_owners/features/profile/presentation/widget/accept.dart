import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget acceptRequire(
  double Function(double) w,
  double Function(double) h,
  String text,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(value: false, onChanged: (value) => true),
      SizedBox(
        width: w(0.6),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: w(0.04),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
