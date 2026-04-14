import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget stopTile(
  double Function(double) h,
  double Function(double) w,
  int index,
  String title,
  String sub,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
   
      width: double.infinity,
      height: h(0.1),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: w(0.05),
            backgroundColor: AppColors.ltOrange,
            child: Center(
              child: Text(
                '0${index + 1}',
                style: GoogleFonts.poppins(
                  fontSize: w(0.03),
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 163, 65, 1),
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: w(0.02),
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          subtitle: Text(
            sub,
            style: GoogleFonts.poppins(
              fontSize: w(0.02),
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 163, 65, 1),
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              size: w(0.04),
              color: const Color.fromARGB(255, 128, 128, 128),
            ),
          ),
        ),
      ),
    ),
  );
}
