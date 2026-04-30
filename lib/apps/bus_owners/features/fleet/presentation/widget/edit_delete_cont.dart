import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/widget/detail_contain.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget editDeleteCont(
  double Function(double) w,
  double Function(double) h,
  VehicleModel model,
) {
  return detailCont(
    w,
    h(0.37),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'CHANGE MANAGEMENT',
          style: GoogleFonts.inter(
            fontSize: w(0.033),
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 90, 36, 0),
          ),
        ),

        SizedBox(
          child: Row(
            children: [
              Icon(
                Icons.add_circle,
                color: const Color.fromARGB(255, 0, 99, 181),
              ),
              SizedBox(width: w(0.03)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CREATED ',
                    style: GoogleFonts.inter(
                      fontSize: w(0.033),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 114, 58, 21),
                    ),
                  ),
                  Text(
                    '${model.createdAt}',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Admin_System_Auto',
                    style: GoogleFonts.inter(
                      fontSize: w(0.033),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(242, 108, 54, 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Icon(Icons.edit_document, color: AppTheme.color),
              SizedBox(width: w(0.03)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LAST MODIFIED',
                    style: GoogleFonts.inter(
                      fontSize: w(0.033),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 114, 58, 21),
                    ),
                  ),
                  Text(
                    '${model.lastModAt}',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.035),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Admin_System_Auto',
                    style: GoogleFonts.inter(
                      fontSize: w(0.033),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(242, 108, 54, 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: w(0.35),
              height: h(0.06),
              decoration: BoxDecoration(
                color: AppTheme.color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.edit, color: Colors.white),
                    Text(
                      'EDIT  ',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.05),
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: w(0.35),
              height: h(0.06),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 233, 233),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 2, color: AppTheme.color),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.delete, color: AppTheme.color),
                    Text(
                      'DELETE',
                      style: GoogleFonts.poppins(
                        fontSize: w(0.05),
                        fontWeight: FontWeight.w700,
                        color: AppTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    bg: const Color.fromARGB(255, 238, 238, 238),
  );
}
