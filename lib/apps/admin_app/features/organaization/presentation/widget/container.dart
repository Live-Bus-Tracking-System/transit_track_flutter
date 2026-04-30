import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/bloc/organaization_bloc.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/rows.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/loading.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/organaization_strings.dart';

Widget orgTable(
  double Function(double) h,
  double Function(double) w,
  BuildContext context,
  AnimationController controller,
) {
  return overContainer(
    double.infinity,
    h(0.9),
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            orgTextField(w, h,context),
            orgDropDown(w, h, context),
            GestureDetector(
              onTap: () {
                controller.repeat();
                context.read<OrganaizationBloc>().add(GetAllOrgEvent());
              },
              child: Container(
                width: w(0.04),
                height: h(0.07),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0,
                    color: const Color.fromARGB(255, 196, 196, 196),
                  ),
                ),
                child: Center(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: controller.value * 2 * 3.1416,
                        child: child,
                      );
                    },
                    child: Icon(Icons.refresh, size: w(0.02)),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: h(0.07)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: w(0.189),
              child: orgHead2(
                OrganaizationStrings.organaization,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: w(0.189),
              child: orgHead2(
                OrganaizationStrings.contact,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: w(0.08),
              child: orgHead2(
                OrganaizationStrings.fleet,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              width: w(0.08),
              child: orgHead2(
                OrganaizationStrings.status,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
            SizedBox(
              child: orgHead2(
                OrganaizationStrings.action,
                w(0.011),
                const Color.fromARGB(255, 127, 127, 127),
              ),
            ),
          ],
        ),
        SizedBox(height: h(0.07)),
        Expanded(
          child: BlocBuilder<OrganaizationBloc, OrganaizationState>(
            builder: (context, state) {
              debugPrint('${state.data}');
              if (state.getStatus == OrgStatus.loading) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CardShimmer();
                  },
                );
              } else if (state.getStatus == OrgStatus.error) {
                controller.stop();
                return Center(
                  child: Text(
                    '${state.error}',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                );
              } else if (state.getStatus == OrgStatus.success) {
                controller.stop();
                if (state.data!.isEmpty) {
                  return Center(
                    child: Text(
                      ' No organaizations available',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.data?.length,
                  itemBuilder: (context, index) {
                    final data = state.data![index];
                    debugPrint('${data.status}');
                    return orgRow(data, w, h, context);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    ),
    20,
  );
}
