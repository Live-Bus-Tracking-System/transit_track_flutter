import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

Widget textStart(String text,double size) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: size,
      color: const Color.fromARGB(255, 121, 121, 121),
    ),
  );
}

Widget textIntro(String text,double size, [Color color = AppTheme.color]) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}
