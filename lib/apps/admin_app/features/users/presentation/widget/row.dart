import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

Widget userRow(double Function(double) w, double Function(double) h) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.18),
        child: Row(
          children: [
            Container(
              width: w(0.03),
              height: h(0.07),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: w(0.01)),
            SizedBox(
              // width: w(0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jordhan Smith',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'jordhansmith@gmail.com',
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
        width: w(0.07),
        child: Text(
          'User',
          style: GoogleFonts.poppins(
            fontSize: w(0.012),
            fontWeight: FontWeight.w600,
            color: AppTheme.color,
          ),
        ),
      ),
      SizedBox(
        width: w(0.05),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Container(
            width: w(0.06),
            height: h(0.04),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 116, 47),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Active',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 187, 255, 214),
                  fontSize: w(0.009),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),

      // SizedBox(
      //   width: w(0.06),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //           Icon(Icons.location_on, size: w(0.013)),
      //           SizedBox(width: w(0.005)),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 '24',
      //                 style: GoogleFonts.poppins(
      //                   fontSize: w(0.009),
      //                   fontWeight: FontWeight.w500,
      //                   color: const Color.fromARGB(255, 118, 118, 118),
      //                 ),
      //               ),
      //               Text(
      //                 'stops',
      //                 style: GoogleFonts.poppins(
      //                   fontSize: w(0.009),
      //                   fontWeight: FontWeight.w500,
      //                   color: const Color.fromARGB(255, 118, 118, 118),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),

      //       Row(
      //         children: [
      //           Icon(Icons.timer, size: w(0.013)),
      //           SizedBox(width: w(0.005)),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Every 8',
      //                 style: GoogleFonts.poppins(
      //                   fontSize: w(0.009),
      //                   fontWeight: FontWeight.w500,
      //                   color: const Color.fromARGB(255, 118, 118, 118),
      //                 ),
      //               ),
      //               Text(
      //                 'mins',
      //                 style: GoogleFonts.poppins(
      //                   fontSize: w(0.009),
      //                   fontWeight: FontWeight.w500,
      //                   color: const Color.fromARGB(255, 118, 118, 118),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // SizedBox(
      //   width: w(0.065),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             '06:00 -',
      //             style: GoogleFonts.poppins(
      //               fontSize: w(0.009),
      //               fontWeight: FontWeight.w500,
      //               color: const Color.fromARGB(255, 118, 118, 118),
      //             ),
      //           ),
      //           Text(
      //             '22:00',
      //             style: GoogleFonts.poppins(
      //               fontSize: w(0.009),
      //               fontWeight: FontWeight.w500,
      //               color: const Color.fromARGB(255, 118, 118, 118),
      //             ),
      //           ),
      //         ],
      //       ),

      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Peak 07:30 -',
      //             style: GoogleFonts.poppins(
      //               fontSize: w(0.009),
      //               fontWeight: FontWeight.w500,
      //               color: const Color.fromARGB(255, 0, 25, 125),
      //             ),
      //           ),
      //           Text(
      //             '09:00',
      //             style: GoogleFonts.poppins(
      //               fontSize: w(0.009),
      //               fontWeight: FontWeight.w500,
      //               color: const Color.fromARGB(255, 0, 25, 125),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      SizedBox(
        width: w(0.15),
        child: Align(
          alignment: AlignmentGeometry.centerEnd,
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock, size: w(0.018)),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.block, color: Colors.red, size: w(0.018)),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
