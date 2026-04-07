import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/features/dashboard/presentation/widget/container.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/private.dart';
import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/public.dart';

import 'package:transit_track_flutter/apps/admin_app/features/fleet_management/presentation/widget/switch.dart';

import 'package:transit_track_flutter/apps/admin_app/widget/sidebar.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/text.dart';
import 'package:transit_track_flutter/apps/admin_app/widget/top_bar.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';
import 'package:transit_track_flutter/core/constants/strings/fleet_strings.dart';

class Fleet extends StatefulWidget {
  const Fleet({super.key});

  @override
  State<Fleet> createState() => _FleetState();
}

class _FleetState extends State<Fleet> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.white,
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
                                head1(FleetStrings.fleet, w(0.034)),
                                head3(FleetStrings.content, w(0.014)),
                              ],
                            ),
                          ),
                          SizedBox(width: w(0.05)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                check = !check;
                                debugPrint('tap tap');
                              });
                            },
                            child: SwitchFleet(check: check),
                          ),
                        ],
                      ),
                      SizedBox(height: h(0.06)),

                      check ? Private() : Public(),
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
