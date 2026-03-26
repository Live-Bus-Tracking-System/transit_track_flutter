import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget routRow(double Function(double) w, double Function(double) h) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.189),
        child: Row(
          children: [
            Container(
              width: w(0.033),
              height: h(0.075),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: w(0.01)),
            SizedBox(
              width: w(0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RT-402',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'Eastside Express',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 103, 103),
                      fontSize: w(0.008),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        width: w(0.189),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: w(0.004)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Grand',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.009),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Central',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.009),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(radius: w(0.004)),
                Column(
                  children: [
                    Text(
                      'Grand',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.009),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Central',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.009),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.08),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.031),
            height: h(0.070),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 229, 229, 229),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                '42',
                style: GoogleFonts.poppins(
                  fontSize: w(0.012),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),

      SizedBox(
        width: w(0.08),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.06),
            height: h(0.04),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 109, 253, 174),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: w(0.003)),
                CircleAvatar(
                  radius: w(0.003),
                  backgroundColor: const Color.fromARGB(255, 1, 116, 47),
                ),
                Text(
                  'Active',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 1, 116, 47),
                    fontSize: w(0.009),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: w(0.003)),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: w(0.04)),
    ],
  );
}
