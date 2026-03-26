import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/chart.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/hover.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/common/text.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(25),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              head1('System Overview', w(0.034)),
                              head3(
                                'Real-Time Status Of TransitTrack Global Network',
                                w(0.014),
                              ),
                            ],
                          ),
                          Container(
                            width: w(0.092),
                            height: h(0.06),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 225, 217),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.calendar_month, size: 15),
                                Text(
                                  'Today: OCT 24',
                                  style: TextStyle(
                                    fontSize: w(0.01),
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h(0.06)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HoverWidget(
                            child: dshContainer(
                              w,
                              h,
                              Icon(
                                Icons.directions_bus,
                                color: const Color.fromARGB(255, 255, 17, 0),
                                size: w(0.025),
                              ),
                              const Color.fromARGB(255, 255, 224, 223),
                              'Active Buses',
                              1992,
                            ),
                          ),
                          HoverWidget(
                            child: dshContainer(
                              w,
                              h,
                              Icon(
                                Icons.route,
                                color: const Color.fromARGB(255, 0, 34, 255),
                                size: w(0.025),
                              ),
                              const Color.fromARGB(255, 222, 228, 255),
                              'Total Routes',
                              234,
                            ),
                          ),
                          HoverWidget(
                            child: dshContainer(
                              w,
                              h,
                              Icon(
                                Icons.business,
                                color: const Color.fromARGB(255, 204, 0, 255),
                                size: w(0.025),
                              ),
                              const Color.fromARGB(255, 247, 221, 255),
                              'Active Buses',
                              1992,
                            ),
                          ),
                          HoverWidget(
                            child: dshContainer(
                              w,
                              h,
                              Icon(
                                Icons.verified_user,
                                color: Colors.red,
                                size: w(0.025),
                              ),
                              const Color.fromARGB(255, 255, 223, 221),
                              'Active Buses',
                              1992,
                            ),
                          ),
                          HoverWidget(
                            child: dshContainer(
                              w,
                              h,
                              Icon(
                                Icons.verified_user,
                                color: Colors.red,
                                size: w(0.025),
                              ),
                              const Color.fromARGB(255, 255, 223, 221),
                              'Active Buses',
                              1992,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h(0.04)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              overContainer(
                                w(0.47),
                                h(0.76),
                                OverviewChart(),
                                w(0.016),
                              ),
                              SizedBox(height: w(0.02)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  overContainer(
                                    w(0.22),
                                    h(0.45),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  ),
                                  SizedBox(width: w(0.025)),
                                  overContainer(
                                    w(0.22),
                                    h(0.45),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'System Alerts',
                                        style: GoogleFonts.poppins(
                                          fontSize: w(0.016),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: w(0.035),
                                        height: h(0.038),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            255,
                                            220,
                                            217,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Live',
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
                                            color: const Color.fromARGB(
                                              255,
                                              255,
                                              227,
                                              223,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
                                            color: const Color.fromARGB(
                                              255,
                                              205,
                                              205,
                                              205,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
