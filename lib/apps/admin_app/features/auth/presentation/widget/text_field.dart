import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget logTextField(
  String label,
  String hint,
  IconData prefix,
  double Function(double) w,
  double Function(double) h,
  TextEditingController controller
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: w(0.01),
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 97, 97, 97),
        ),
      ),
      SizedBox(height: h(0.008)),
      Container(
        padding: EdgeInsets.all(w(0.005)),
        width: w(0.24),
        height: h(0.07),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 122, 122, 122),
              fontSize: w(0.01),
            ),
            prefixIcon: Icon(prefix, size: w(0.014)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    ],
  );
}
