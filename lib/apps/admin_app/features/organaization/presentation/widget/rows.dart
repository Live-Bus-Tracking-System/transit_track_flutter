import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/data/model/organaization_model.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/staus_card.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget orgRow(
  OrganaizationModel data,
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
) {
  context.read<OrganaizationBloc>().add(GetFleetCountById(data.id!));
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
              child: Text(
                data.name!,
                style: GoogleFonts.poppins(
                  fontSize: w(0.012),
                  fontWeight: FontWeight.w600,
                ),
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
            Text(
              data.phone!,
              style: GoogleFonts.poppins(
                fontSize: w(0.012),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data.email!,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 103, 103, 103),
              ),
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
              child: BlocBuilder<OrganaizationBloc, OrganaizationState>(
                builder: (context, state) {
                  return Text(
                    '${state.totalFleet ?? 1}',
                    style: GoogleFonts.poppins(
                      fontSize: w(0.012),
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),

      SizedBox(width: w(0.08), child: statusCard(h, w, data.status!)),
      SizedBox(
        width: w(0.04),
        child: PopupMenuButton<String>(
          color: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          onSelected: (value) {
            if (value == 'activate') {
              context.read<OrganaizationBloc>().add(ActivateOrgEvent(data.id!));
              context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            } else if (value == 'suspend') {
              context.read<OrganaizationBloc>().add(SuspendOrgEvent(data.id!));
              context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            } else {
              context.read<OrganaizationBloc>().add(DeleteOrgEvent(data.id!));
              context.read<OrganaizationBloc>().add(GetAllOrgEvent());
            }
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
              value: 'suspend',
              child: Row(
                children: [
                  Icon(Icons.pause_circle_outline, size: w(0.015)),
                  SizedBox(width: w(0.01)),
                  Text(
                    'Suspend',
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
