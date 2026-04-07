import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/private_row.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/public_row.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/chart.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/fleet_strings.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Private extends StatefulWidget {
  const Private({super.key});

  @override
  State<Private> createState() => _PrivateState();
}

class _PrivateState extends State<Private> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            overContainer(
              w(0.175),
              h(0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: orgHead2(
                      FleetStrings.uptime,
                      w(0.012),
                      const Color.fromARGB(255, 92, 92, 92),
                    ),
                  ),
                  SizedBox(
                    height: h(0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        orgHead1('99.98%', w(0.025), AppColors.black),
                        SizedBox(width: w(0.005)),
                      ],
                    ),
                  ),
                ],
              ),
              w(0.012),
              AppColors.bg,
            ),
            overContainer(
              w(0.175),
              h(0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: orgHead2(
                      FleetStrings.units,
                      w(0.012),
                      const Color.fromARGB(255, 92, 92, 92),
                    ),
                  ),
                  SizedBox(
                    height: h(0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        orgHead1('1,402', w(0.025), AppColors.black),
                        SizedBox(width: w(0.005)),
                      ],
                    ),
                  ),
                ],
              ),
              w(0.01),
              AppColors.bg,
            ),
            overContainer(
              w(0.175),
              h(0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: orgHead2(
                      FleetStrings.rtAdherence,
                      w(0.012),
                      const Color.fromARGB(255, 92, 92, 92),
                    ),
                  ),
                  SizedBox(
                    height: h(0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        orgHead1('92.4%', w(0.025), AppColors.black),
                        SizedBox(width: w(0.005)),
                      ],
                    ),
                  ),
                ],
              ),
              w(0.01),
              AppColors.bg,
            ),
            overContainer(
              w(0.175),
              h(0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: orgHead2(
                      FleetStrings.global,
                      w(0.012),
                      const Color.fromARGB(255, 254, 206, 185),
                    ),
                  ),
                  SizedBox(
                    height: h(0.07),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        orgHead1('A+', w(0.025), AppColors.white),
                        SizedBox(width: w(0.08)),
                        Icon(
                          Icons.star,
                          color: const Color.fromARGB(255, 254, 206, 185),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              w(0.01),
              AppTheme.color,
            ),
          ],
        ),
        SizedBox(height: h(0.025)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                overContainer(
                  w(0.49),
                  h(0.76),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w(0.09),
                            child: orgHead2(
                              FleetStrings.id,
                              w(0.011),
                              const Color.fromARGB(255, 127, 127, 127),
                            ),
                          ),
                          SizedBox(
                            width: w(0.09),
                            child: orgHead2(
                              FleetStrings.route,
                              w(0.011),
                              const Color.fromARGB(255, 127, 127, 127),
                            ),
                          ),
                          SizedBox(
                            width: w(0.11),
                            child: orgHead2(
                              FleetStrings.fuel,
                              w(0.011),
                              const Color.fromARGB(255, 127, 127, 127),
                            ),
                          ),
                          SizedBox(
                            width: w(0.1),
                            child: orgHead2(
                              FleetStrings.stop,
                              w(0.011),
                              const Color.fromARGB(255, 127, 127, 127),
                            ),
                          ),
                          SizedBox(
                            width: w(0.05),
                            child: orgHead2(
                              FleetStrings.status,
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
                            privateRow(w, h),
                            SizedBox(height: h(0.06)),
                            privateRow(w, h),
                            SizedBox(height: h(0.06)),
                            privateRow(w, h),
                            SizedBox(height: h(0.06)),
                            privateRow(w, h),
                          ],
                        ),
                      ),
                    ],
                  ),
                  w(0.016),
                  AppColors.bg,
                ),
                SizedBox(height: w(0.02)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    overContainer(
                      w(0.22),
                      h(0.45),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'On-Time Performance',
                            style: GoogleFonts.poppins(
                              fontSize: w(0.015),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: h(0.25),
                                width: w(0.12),
                                child: CircularProgressIndicator(
                                  value: 0.85,
                                  strokeWidth: w(0.01),
                                  color: AppTheme.color,
                                ),
                              ),
                              Text(
                                "75%",
                                style: GoogleFonts.poppins(
                                  fontSize: w(0.02),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(),
                        ],
                      ),
                      w(0.016),
                      AppColors.bg,
                    ),
                    SizedBox(width: w(0.025)),
                    overContainer(
                      w(0.22),
                      h(0.45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CO Savings',
                            style: TextStyle(
                              fontSize: w(0.015),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: RowBlockGraph(
                              data: [10, 80, 100, 150, 30, 60],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      w(0.016),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: w(0.01)),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(w(0.016)),
                width: w(0.27),
                height: h(1.25),
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FleetStrings.alert,
                          style: GoogleFonts.poppins(
                            fontSize: w(0.016),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: w(0.035),
                          height: h(0.038),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 220, 217),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              FleetStrings.live,
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h(0.04)),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            width: double.infinity,
                            height: h(0.3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 227, 223),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(-4, 0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h(0.03)),
                          Container(
                            width: double.infinity,
                            height: h(0.27),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 205, 205),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
