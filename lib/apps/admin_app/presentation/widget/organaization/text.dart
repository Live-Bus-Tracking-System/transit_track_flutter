import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget orgHead1(String text, double size, Color color) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Widget orgHead2(String text,double size,Color color) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color:color,
    ),
  );
}
