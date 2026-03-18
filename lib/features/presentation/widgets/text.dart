import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

Widget textStart(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 11.sp,
      color: const Color.fromARGB(255, 121, 121, 121),
    ),
  );
}

Widget textIntro(String text,[Color color=AppTheme.color]) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      color:color,
      fontSize: 29.sp,
      fontWeight: FontWeight.w700,
    ),
  );
}
