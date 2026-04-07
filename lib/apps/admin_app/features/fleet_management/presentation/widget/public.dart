import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/public_row.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/fleet_strings.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Public extends StatefulWidget {
  const Public({super.key});

  @override
  State<Public> createState() => _PublicState();
}

class _PublicState extends State<Public> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Column(
      children: [
        overContainer(
          double.infinity,
          h(0.15),
          Row(children: [fltTextField(w, h)]),
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
        SizedBox(height: h(0.04)),
        overContainer(
          double.infinity,
          h(0.9),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FleetStrings.units,
                    style: GoogleFonts.poppins(
                      fontSize: w(0.017),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: w(0.025),
                        height: h(0.06),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Icon(Icons.download, size: w(0.015)),
                        ),
                      ),
                      SizedBox(width: w(0.008)),
                      Container(
                        width: w(0.025),
                        height: h(0.06),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.download,
                            size: w(0.015),
                            color: const Color.fromARGB(255, 138, 138, 138),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: h(0.07)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w(0.13),
                    child: orgHead2(
                      FleetStrings.asset,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                  SizedBox(
                    width: w(0.115),
                    child: orgHead2(
                      FleetStrings.operator,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                  SizedBox(
                    width: w(0.14),
                    child: orgHead2(
                      FleetStrings.load,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                  SizedBox(
                    width: w(0.073),
                    child: orgHead2(
                      FleetStrings.station,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                  SizedBox(
                    width: w(0.08),
                    child: orgHead2(
                      FleetStrings.status,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                  SizedBox(width: w(0.00)),
                  SizedBox(
                    width: w(0.043),
                    child: orgHead2(
                      FleetStrings.action,
                      w(0.011),
                      const Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: h(0.06)),
                    publicRow(w, h),
                    SizedBox(height: h(0.06)),
                    publicRow(w, h),
                    SizedBox(height: h(0.06)),
                    publicRow(w, h),
                    SizedBox(height: h(0.06)),
                    publicRow(w, h),
                  ],
                ),
              ),
            ],
          ),
          20,
          const Color.fromARGB(255, 229, 236, 239),
        ),
        SizedBox(height: h(0.05)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            overContainer(
              w(0.37),
              h(0.4),
              SizedBox(),
              w(0.12),
              AppColors.ltOrange,
            ),
            overContainer(
              w(0.37),
              h(0.4),
              SizedBox(),
              w(0.12),
              const Color.fromARGB(255, 0, 16, 50),
            ),
          ],
        ),
      ],
    );
  }
}
