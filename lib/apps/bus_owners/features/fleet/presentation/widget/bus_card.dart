import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/data/model/vehicle_model.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget busCard(
  double Function(double) w,
  double Function(double) h,
  VehicleModel model,
) {
  return Align(
    alignment: AlignmentGeometry.center,
    child: Container(
      padding: EdgeInsets.all(w(0.06)),
      margin: EdgeInsets.only(bottom: w(0.05)),
      width: double.infinity,
      height: h(0.48),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 142, 142, 142).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w(0.13),
                height: h(0.06),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 212, 209),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Icon(
                    Icons.directions_bus,
                    color: const Color.fromARGB(255, 172, 37, 0),
                    size: w(0.08),
                  ),
                ),
              ),
              Container(
                width: w(0.24),
                height: h(0.03),
                decoration: BoxDecoration(
                  color: model.isACtive == true
                      ? const Color.fromARGB(255, 106, 178, 255)
                      : const Color.fromARGB(255, 255, 230, 228),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: model.isACtive == true
                      ? Text(
                          'ONLINE',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: w(0.03),
                          ),
                        )
                      : Text(
                          'OFFLINE',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: w(0.03),
                          ),
                        ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: w(0.065),
                  ),
                ),
                Text(
                  'PLATE:${model.licensePlt}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: w(0.05),
                    color: const Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VEHICLE ID',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: w(0.04),
                    color: AppTheme.color,
                  ),
                ),
                Text(
                  model.id!,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: w(0.04),
                    color: const Color.fromARGB(255, 139, 139, 139),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CAPACITY',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.04),
                      color: AppTheme.color,
                    ),
                  ),
                  Text(
                    '${model.capacity}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.06),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DEPLOYMENT',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.04),
                      color: AppTheme.color,
                    ),
                  ),
                  Text(
                    model.createdAt!,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.06),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
          Text(
            'ORG:${model.orgId}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: w(0.04),
              color: const Color.fromARGB(255, 140, 140, 140),
            ),
          ),
        ],
      ),
    ),
  );
}
