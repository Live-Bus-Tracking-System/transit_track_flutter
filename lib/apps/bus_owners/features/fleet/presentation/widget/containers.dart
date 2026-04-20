import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget certificateCont(double Function(double) w, double Function(double) h) {
  final TextEditingController controller = TextEditingController();
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(w(0.06)),
        width: double.infinity,
        height: h(0.57),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.color,
              // blurRadius: 8,
              offset: Offset(-4, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.document_scanner,
                  size: w(0.05),
                  color: AppTheme.color,
                ),
                SizedBox(width: w(0.014)),
                Text(
                  'Registration Certificate',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Container(
              // padding: EdgeInsets.all(w(0.005)),
              width: double.infinity,
              height: h(0.16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 213, 168, 138),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.file_upload,
                    color: const Color.fromARGB(255, 123, 123, 123),
                    size: w(0.09),
                  ),
                  Text(
                    'UPLOAD RC PDF/IMAGE',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.03),
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 123, 123, 123),
                    ),
                  ),
                ],
              ),
            ),
            commonField('CERTIFICATE NUMBER', '', w, h, controller),
            commonField('ISSUED BY', '', w, h, controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonField(
                  'ISSUED AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  controller,
                  b: w(0.35),
                ),
                // SizedBox(),
                commonField(
                  'EXPIRES AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  controller,
                  b: w(0.35),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: h(0.04)),
      mainContain(
        w,
        double.infinity,
        h(0.57),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.document_scanner,
                  size: w(0.05),
                  color: AppTheme.color,
                ),
                SizedBox(width: w(0.014)),
                Text(
                  'PERMIT CERTIFICATE',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Container(
              // padding: EdgeInsets.all(w(0.005)),
              width: double.infinity,
              height: h(0.16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 213, 168, 138),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.file_upload,
                    color: const Color.fromARGB(255, 123, 123, 123),
                    size: w(0.09),
                  ),
                  Text(
                    'UPLOAD PRMIT DOC',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.03),
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 123, 123, 123),
                    ),
                  ),
                ],
              ),
            ),
            commonField('CERTIFICATE NUMBER', '', w, h, controller),
            commonField('ISSUED BY', '', w, h, controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonField(
                  'ISSUED AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  controller,
                  b: w(0.35),
                ),
                // SizedBox(),
                commonField(
                  'EXPIRES AT',
                  'mm/dd/yyyy',
                  w,
                  h,
                  controller,
                  b: w(0.35),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: h(0.04)),
      Container(
        width: double.infinity,
        height: h(0.07),
        decoration: BoxDecoration(
          color: AppTheme.color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 109, 109, 109).withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'REGISTER VEHICLE',
            style: GoogleFonts.poppins(
              fontSize: w(0.05),
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
