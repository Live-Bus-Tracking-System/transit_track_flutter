import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/core/constants/strings/admin/fleet_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget fleetSearchField(
  double Function(double) w,
  double Function(double) h,
  BuildContext context,
  String id,
) {
  return Column(
    children: [
      overContainer(
        double.infinity,
        h(0.15),
        Row(children: [fltTextField(w, h, context, id)]),
        w(0.01),
        const Color.fromARGB(255, 229, 236, 239),
      ),
      SizedBox(height: h(0.06)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(w(0.02)),
            width: w(0.4),
            height: h(0.29),
            decoration: BoxDecoration(
              color: AppTheme.color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    102,
                    102,
                    102,
                  ).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: orgHead2(
                        FleetStrings.adherence,
                        w(0.012),
                        const Color.fromARGB(255, 226, 226, 226),
                      ),
                    ),
                    SizedBox(
                      child: orgHead1(
                        '94.8%',
                        w(0.035),
                        const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Expanded(
                      child: orgHead2(
                        '+2.4% from peak morning commute',
                        w(0.012),
                        const Color.fromARGB(255, 255, 207, 176),
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.gas_meter,
                  size: w(0.07),
                  color: const Color.fromARGB(255, 255, 157, 128),
                ),
              ],
            ),
          ),
          overContainer(
            w(0.16),
            h(0.29),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: orgHead2(
                    FleetStrings.partners,
                    w(0.012),
                    const Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                SizedBox(
                  height: h(0.07),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      orgHead1('12,482', w(0.025), Colors.black),
                      SizedBox(width: w(0.005)),
                    ],
                  ),
                ),
              ],
            ),
            w(0.02),
          ),

          overContainer(
            w(0.16),
            h(0.29),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: orgHead2(
                    FleetStrings.distruptions,
                    w(0.012),
                    const Color.fromARGB(255, 174, 0, 0),
                  ),
                ),
                SizedBox(
                  height: h(0.07),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      orgHead1(
                        '03',
                        w(0.025),
                        const Color.fromARGB(255, 174, 0, 0),
                      ),
                      SizedBox(width: w(0.005)),
                    ],
                  ),
                ),
              ],
            ),
            w(0.02),
            const Color.fromARGB(255, 255, 231, 231),
          ),
        ],
      ),
    ],
  );
}
