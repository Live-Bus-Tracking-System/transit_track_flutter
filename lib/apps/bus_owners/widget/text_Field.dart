import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonField(
  String label,
  String hint,
  double Function(double) w,
  double Function(double) h,
  String? Function(String?) validator,
  TextEditingController controller, {
  double? b,
  int? lines,
  double? hi,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: w(0.032),
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 135, 135, 135),
        ),
      ),
      SizedBox(height: h(0.008)),
      Container(
        // padding: EdgeInsets.all(w(0.00)),
        width: b ?? double.infinity,
        height: hi ?? h(0.05),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          maxLines: lines ?? 1,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 122, 122, 122),
              fontSize: w(0.031),
            ),

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
