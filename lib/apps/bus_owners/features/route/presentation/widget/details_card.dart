import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/data/model/place_dtls_model.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/bloc/route_bloc.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget detailsCard(
  double Function(double) w,
  double Function(double) h,
  PlaceDtlsModel model,
  BuildContext context,
) {
  return Positioned(
    bottom: 30,
    left: 0,
    right: 0,
    child: mainContain(
      w,
      w(0.83),
      h(0.39),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'SELECTED LOCATION',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: w(0.025),
              color: AppTheme.color,
            ),
          ),
          Text(
            '${model.village}',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: w(0.06),
              color: AppColors.black,
            ),
          ),
          Text(
            'LAT: ${model.lat} N, LON: ${model.lon} W',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: w(0.04),
              color: const Color.fromARGB(255, 121, 121, 121),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(w(0.025)),
                width: w(0.32),
                height: h(0.08),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.bg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'STOP TYPE',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: w(0.02),
                        color: const Color.fromARGB(255, 137, 137, 137),
                      ),
                    ),
                    Text(
                      'Express Stop',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: w(0.03),
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(w(0.025)),
                width: w(0.32),
                height: h(0.08),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.bg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'ESTIMATED LOAD',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: w(0.02),
                        color: const Color.fromARGB(255, 137, 137, 137),
                      ),
                    ),
                    Text(
                      'Moderate',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: w(0.03),
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.read<RouteBloc>().add(ConfirmLocationDtlsEvent());
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: h(0.07),
              decoration: BoxDecoration(
                color: AppTheme.color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      109,
                      109,
                      109,
                    ).withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'CONFIRM WAYPOINT',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.05),
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
