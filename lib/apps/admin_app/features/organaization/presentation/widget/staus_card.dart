import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';

Widget statusCard(double Function(double) h, double Function(double) w, int s) {
  String text = '';
  Color color = Colors.white;
  Color bgColor = Colors.white;
  switch (s) {
    case 2:
      text = 'Active';
      color = const Color.fromARGB(255, 0, 85, 3);
      bgColor = const Color.fromARGB(255, 196, 255, 199);
    case 1:
      text = 'Pending';
      color = const Color.fromARGB(255, 194, 94, 0);
      bgColor = const Color.fromARGB(255, 255, 232, 205);
    case 3:
      text = 'Suspended';
      color = const Color.fromARGB(255, 142, 109, 0);
      bgColor = const Color.fromARGB(255, 255, 247, 201);
    case 4:
      text = 'Rejected';
      color = const Color.fromARGB(255, 147, 0, 0);
      bgColor = const Color.fromARGB(255, 255, 222, 222);
  }
  return Align(
    alignment: AlignmentGeometry.centerLeft,
    child: Container(
      width: w(0.065),
      height: h(0.04),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: color,
            fontSize: w(0.009),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
