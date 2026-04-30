import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/rows.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text_field.dart';
import 'package:transit_track_flutter/apps/admin_app/features/permit/presentation/widget/row.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/permit_strings.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class Permit extends StatelessWidget {
  const Permit({super.key});

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
                                head1(PermitStrings.permitHead, w(0.034)),
                                head3(PermitStrings.content, w(0.014)),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.05)),
                          Container(
                            width: w(0.12),
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
                                  PermitStrings.add,
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
                          overContainer(
                            w(0.16),
                            h(0.22),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: orgHead2(
                                    PermitStrings.total,
                                    w(0.012),
                                    const Color.fromARGB(255, 87, 87, 87),
                                  ),
                                ),
                                SizedBox(
                                  height: h(0.07),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      orgHead1('1,284', w(0.025), Colors.black),
                                      SizedBox(width: w(0.005)),
                                      Text(
                                        '+12%',
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                            255,
                                            35,
                                            110,
                                            0,
                                          ),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            w(0.02),
                          ),

                          overContainer(
                            w(0.16),
                            h(0.22),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: orgHead2(
                                    PermitStrings.actionReq,
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
                                        '24',
                                        w(0.025),
                                        const Color.fromARGB(255, 174, 0, 0),
                                      ),
                                      SizedBox(width: w(0.005)),
                                      Text(
                                        'Expired',
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                            255,
                                            174,
                                            0,
                                            0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            w(0.02),
                            const Color.fromARGB(255, 255, 231, 231),
                          ),
                          Container(
                            padding: EdgeInsets.all(w(0.02)),
                            width: w(0.4),
                            height: h(0.22),
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
                                    Expanded(
                                      child: orgHead2(
                                        PermitStrings.velocity,
                                        w(0.012),
                                        AppTheme.color,
                                      ),
                                    ),
                                    SizedBox(
                                      child: orgHead1(
                                        '89% Approval Rate',
                                        w(0.025),
                                        const Color.fromARGB(255, 156, 37, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                SizedBox(
                                  width: w(0.065),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: h(0.035),
                                        child: overContainer(
                                          w(0.03),
                                          h(0.065),
                                          SizedBox(),
                                          0,
                                          Colors.brown,
                                        ),
                                      ),
                                      Positioned(
                                        left: w(0.015),
                                        top: h(0.035),
                                        child: overContainer(
                                          w(0.03),
                                          h(0.065),
                                          SizedBox(),
                                          0,
                                          Colors.blue,
                                        ),
                                      ),
                                      Positioned(
                                        left: w(0.03),
                                        top: h(0.035),
                                        child: overContainer(
                                          w(0.03),
                                          h(0.065),
                                          Center(
                                            child: Text(
                                              '+5',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          0,
                                          Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h(0.04)),
                      overContainer(
                        double.infinity,
                        h(0.16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: w(0.05),
                              child: orgHead2(
                                PermitStrings.id,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                            SizedBox(
                              width: w(0.05),
                              child: orgHead2(
                                PermitStrings.type,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                            SizedBox(
                              width: w(0.1),
                              child: orgHead2(
                                PermitStrings.org,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                            SizedBox(
                              width: w(0.05),
                              child: orgHead2(
                                PermitStrings.expiry,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                            SizedBox(
                              width: w(0.15),
                              child: orgHead2(
                                PermitStrings.status,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                            SizedBox(
                              width: w(0.05),
                              child: orgHead2(
                                PermitStrings.action,
                                w(0.011),
                                const Color.fromARGB(255, 127, 127, 127),
                              ),
                            ),
                          ],
                        ),
                        w(0.02),
                      ),
                      SizedBox(height: h(0.04)),
                      overContainer(
                        double.infinity,
                        h(0.9),
                        ListView(
                          children: [
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                            SizedBox(height: h(0.05)),
                            permitRow(w, h),
                          ],
                        ),
                        20,
                      ),
                      SizedBox(height: h(0.05)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          overContainer(
                            w(0.535),
                            h(0.55),
                            SizedBox(),
                            w(0.12),
                            AppColors.white,
                          ),
                          overContainer(
                            w(0.2),
                            h(0.55),
                            SizedBox(),
                            w(0.12),
                            const Color.fromARGB(255, 0, 87, 55),
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
