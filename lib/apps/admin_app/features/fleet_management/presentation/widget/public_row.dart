import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/data/model/fleet_cover_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/switch.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget publicRow(
  double Function(double) w,
  double Function(double) h,
  FleetCoverModel model,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: w(0.13),
        child: Row(
          children: [
            Container(
              width: w(0.03),
              height: h(0.075),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 221, 221),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(Icons.directions_bus, color: Colors.red),
              ),
            ),
            SizedBox(width: w(0.01)),
            SizedBox(
              width: w(0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.id!,
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    model.name!,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 103, 103, 103),
                      fontSize: w(0.008),
                    ),
                  ),
                  // Text(
                  //   'Downtown Express',
                  //   style: GoogleFonts.poppins(
                  //     color: const Color.fromARGB(255, 103, 103, 103),
                  //     fontSize: w(0.008),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        width: w(0.115),
        child: Text(
          model.licensePlt!,
          style: GoogleFonts.poppins(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: w(0.01),
          ),
        ),
      ),
      SizedBox(
        width: w(0.14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '89%',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 103, 103, 103),
                    fontSize: w(0.008),
                  ),
                ),
                SizedBox(width: w(0.056)),
                Text(
                  '${model.capacity}/100',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 103, 103, 103),
                    fontSize: w(0.008),
                  ),
                ),
              ],
            ),
            SizedBox(height: h(0.005)),
            Stack(
              children: [
                Container(
                  width: w(0.1),
                  height: h(0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 255, 225, 225),
                  ),
                ),
                Container(
                  width: w(0.09),
                  height: h(0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 255, 45, 45),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: w(0.073),
        child: Text(
          model.createdAt!,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 81, 81, 81),
            fontWeight: FontWeight.w600,
            fontSize: w(0.01),
          ),
        ),
      ),
      SizedBox(width: w(0.08), child: statusCardFlt(h, w, model.isActive!)),
      SizedBox(width: w(0.00)),
      SizedBox(
        width: w(0.043),
        child: PopupMenuButton<String>(
          color: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          onSelected: (value) {
            // if (value == 'activate') {
            //   context.read<OrganaizationBloc>().add(ActivateOrgEvent(data.id!));
            //   context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            // } else if (value == 'suspend') {
            //   context.read<OrganaizationBloc>().add(SuspendOrgEvent(data.id!));
            //   context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            // } else {
            //   context.read<OrganaizationBloc>().add(DeleteOrgEvent(data.id!));
            //   context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            // }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'activate',
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline_outlined, size: w(0.015)),
                  SizedBox(width: w(0.01)),
                  Text(
                    'Activate',
                    style: GoogleFonts.poppins(fontSize: w(0.012)),
                  ),
                ],
              ),
            ),

            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline_outlined,
                    size: w(0.015),
                    color: const Color.fromARGB(255, 216, 14, 0),
                  ),
                  SizedBox(width: w(0.01)),
                  Text(
                    'Delete',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      color: const Color.fromARGB(255, 205, 14, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
          icon: Icon(Icons.more_vert),
        ),
      ),
    ],
  );
}
