import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transit_track_flutter/apps/admin_app/features/organaization/presentation/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/features/route/presentation/widget/row.dart';
import 'package:transit_track_flutter/apps/admin_app/features/users/presentation/widget/row.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/users_strings.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';

class Users extends StatelessWidget {
  const Users({super.key});

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
                                head1(UsersStrings.usersHead, w(0.034)),
                                head3(UsersStrings.content, w(0.014)),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.05)),
                          Container(
                            width: w(0.1),
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
                                  UsersStrings.add,
                                  style: GoogleFonts.poppins(
                                    fontSize: w(0.012),
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.16)),
                        ],
                      ),
                      SizedBox(height: h(0.06)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(w(0.02)),
                            width: w(0.2),
                            height: h(0.2),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: orgHead2(
                                        UsersStrings.active,
                                        w(0.012),
                                        const Color.fromARGB(255, 87, 87, 87),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h(0.07),
                                      child: orgHead1(
                                        '124',
                                        w(0.028),
                                        AppTheme.color,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.now_widgets,
                                  size: w(0.04),
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
                            h(0.2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      orgHead2(
                                        UsersStrings.total,
                                        w(0.012),
                                        const Color.fromARGB(
                                          255,
                                          224,
                                          224,
                                          224,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: orgHead1(
                                    '1200',
                                    w(0.025),
                                    Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            w(0.02),
                            AppTheme.color,
                          ),

                          SizedBox(width: w(0.36)),
                        ],
                      ),
                      SizedBox(height: h(0.04)),
                      Align(
                        alignment: AlignmentGeometry.centerStart,
                        child: overContainer(
                          w(0.6),
                          h(0.9),
                          Column(
                            children: [
                              // SizedBox(height: h(0.07)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: w(0.18),
                                    child: orgHead2(
                                      UsersStrings.user,
                                      w(0.011),
                                      const Color.fromARGB(255, 127, 127, 127),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(0.07),
                                    child: orgHead2(
                                      UsersStrings.role,
                                      w(0.011),
                                      const Color.fromARGB(255, 127, 127, 127),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(0.05),
                                    child: orgHead2(
                                      UsersStrings.status,
                                      w(0.011),
                                      const Color.fromARGB(255, 127, 127, 127),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w(0.15),
                                    child: Align(
                                      alignment: AlignmentGeometry.centerEnd,
                                      child: orgHead2(
                                        UsersStrings.action,
                                        w(0.011),
                                        const Color.fromARGB(
                                          255,
                                          127,
                                          127,
                                          127,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    SizedBox(height: h(0.06)),
                                    userRow(w, h),
                                    SizedBox(height: h(0.06)),
                                    userRow(w, h),
                                    SizedBox(height: h(0.06)),
                                    userRow(w, h),
                                    SizedBox(height: h(0.06)),
                                    userRow(w, h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          20,
                          AppColors.ltOrange,
                        ),
                      ),
                      SizedBox(height: h(0.05)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          overContainer(
                            w(0.6),
                            h(0.55),
                            SizedBox(),
                            w(0.12),
                            const Color.fromARGB(255, 225, 224, 212),
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
