import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';

Widget dshContainer(
  double Function(double) w,
  double Function(double) h,
  Icon icon,
  Color color,
  String text,
  int count,
) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    padding: EdgeInsets.all(w(0.016)),
    width: w(0.14),

    height: h(0.35),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 102, 102, 102).withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: w(0.10),
                height: h(0.14),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(child: icon),
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        Expanded(
          child: Text(text, style: GoogleFonts.poppins(fontSize: w(0.012))),
        ),
        Expanded(
          child: Text(
            count.toString(),
            style: GoogleFonts.poppins(
              fontSize: w(0.02),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget overContainer(
  double width,
  double height,
  Widget child,
  double padding,
  [Color bg=AppColors.white]
) {
  return Container(
    padding: EdgeInsets.all(padding),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 102, 102, 102).withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: child,
  );
}
