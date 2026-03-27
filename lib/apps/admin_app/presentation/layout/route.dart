import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/common/text.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/organaization/rows.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/organaization/text.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/organaization/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/route/row.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/presentation/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                head3(
                                  'SYSTEM INFRASTRUCTURE',
                                  w(0.014),
                                  AppTheme.color,
                                ),
                                head1('Route Management', w(0.034)),
                                head3(
                                  'Design, Optimize, and oversee the kinetic flow of the city. Manage active corridors and establish future transit lines with precision',
                                  w(0.014),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.05)),
                          Container(
                            width: w(0.15),
                            height: h(0.08),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppTheme.color,
                                  const Color.fromARGB(255, 255, 98, 50),
                                ],
                                begin: AlignmentGeometry.topLeft,
                                end: AlignmentGeometry.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 17,
                                  weight: 7,
                                  color: AppColors.white,
                                ),
                                Text(
                                  'Draw New Route',
                                  style: GoogleFonts.poppins(
                                    fontSize: w(0.012),
                                    color: AppColors.white,
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
                          Container(
                            padding: EdgeInsets.all(w(0.02)),
                            width: w(0.4),
                            height: h(0.28),
                            decoration: BoxDecoration(
                              color: AppColors.ltOrange,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: h(0.029)),
                                    Expanded(
                                      child: orgHead2(
                                        'TOTAL PARTNERS',
                                        w(0.012),
                                        const Color.fromARGB(255, 87, 87, 87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h(0.07),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          orgHead1(
                                            '1240.5',
                                            w(0.028),
                                            AppTheme.color,
                                          ),
                                          SizedBox(width: w(0.005)),
                                          Text(
                                            'km/day',
                                            style: GoogleFonts.poppins(
                                              color: AppTheme.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: h(0.029)),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.shelves,
                                  size: w(0.07),
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    157,
                                    128,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          overContainer(
                            w(0.16),
                            h(0.28),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: w(0.005),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          0,
                                          76,
                                          3,
                                        ),
                                      ),
                                      SizedBox(width: w(0.005)),
                                      orgHead2(
                                        'SYSTEM HEALTH',
                                        w(0.012),
                                        const Color.fromARGB(255, 87, 87, 87),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: orgHead1(
                                    '98.2%',
                                    w(0.025),
                                    Colors.black,
                                  ),
                                ),

                                Expanded(
                                  child: orgHead2(
                                    'On-time frequency',
                                    w(0.009),
                                    const Color.fromARGB(255, 82, 82, 82),
                                  ),
                                ),
                              ],
                            ),
                            w(0.02),
                          ),
                          overContainer(
                            w(0.16),
                            h(0.28),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: w(0.005),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          0,
                                          27,
                                          95,
                                        ),
                                      ),
                                      SizedBox(width: w(0.005)),
                                      orgHead2(
                                        'UPCOMING',
                                        w(0.012),
                                        const Color.fromARGB(255, 87, 87, 87),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: orgHead1(
                                    '98.2%',
                                    w(0.025),
                                    const Color.fromARGB(255, 1, 15, 104),
                                  ),
                                ),

                                Expanded(
                                  child: orgHead2(
                                    'Routes pending launch',
                                    w(0.009),
                                    const Color.fromARGB(255, 82, 82, 82),
                                  ),
                                ),
                              ],
                            ),
                            w(0.02),
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
                                  'Active Corridor List',
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
                                        child: Icon(
                                          Icons.window,
                                          size: w(0.01),
                                        ),
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
                                          Icons.window,
                                          size: w(0.015),
                                          color: const Color.fromARGB(
                                            255,
                                            138,
                                            138,
                                            138,
                                          ),
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
                                  width:  w(0.13),
                                  child: orgHead2(
                                    'ROUTE ID',
                                    w(0.011),
                                    const Color.fromARGB(255, 127, 127, 127),
                                  ),
                                ),
                                SizedBox(
                                  width: w(0.115),
                                  child: orgHead2(
                                    'GEAOGRAPHY',
                                    w(0.011),
                                    const Color.fromARGB(255, 127, 127, 127),
                                  ),
                                ),
                                SizedBox(
                                  width: w(0.065),
                                  child: orgHead2(
                                    'MATRICS',
                                    w(0.011),
                                    const Color.fromARGB(255, 127, 127, 127),
                                  ),
                                ),
                                SizedBox(
                                  width: w(0.073),
                                  child: orgHead2(
                                    'OPERATING WINDOW',
                                    w(0.011),
                                    const Color.fromARGB(255, 127, 127, 127),
                                  ),
                                ),
                                SizedBox(
                                  width: w(0.1),
                                  child: orgHead2(
                                    'STATUS',
                                    w(0.011),
                                    const Color.fromARGB(255, 127, 127, 127),
                                  ),
                                ),
                                SizedBox(width: w(0.00),),
                                SizedBox(
                                  width: w(0.043),
                                  child: orgHead2(
                                    'ACTION',
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
                                  routRow(w, h),
                                  SizedBox(height: h(0.06)),
                                  routRow(w, h),
                                  SizedBox(height: h(0.06)),
                                  routRow(w, h),
                                  SizedBox(height: h(0.06)),
                                  routRow(w, h),
                                ],
                              ),
                            ),
                          ],
                        ),
                        20,
                        AppColors.ltOrange,
                      ),
                      SizedBox(height: h(0.05)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          overContainer(w(0.535), h(0.55), SizedBox(), w(0.12),const Color.fromARGB(255, 35, 34, 56)),
                           overContainer(w(0.2), h(0.55), SizedBox(), w(0.12),AppColors.ltOrange),
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
