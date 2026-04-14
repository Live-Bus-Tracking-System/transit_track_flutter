import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/admin_app/main.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/view/way_point.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/route/presentation/widget/stop_tile.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/containers.dart';
import 'package:transit_track_flutter/apps/bus_owners/widget/text_Field.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Route',
          style: GoogleFonts.poppins(
            fontSize: w(0.05),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: ListView(
        padding: EdgeInsets.all(w(0.052)),
        children: [
          SizedBox(height: h(0.02)),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: SizedBox(
              width: w(0.4),
              child: Text(
                'Add New Routes',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: w(0.08),
                  color: AppTheme.color,
                ),
              ),
            ),
          ),
          SizedBox(height: h(0.02)),
          mainContain(
            w,
            double.infinity,
            h(0.38),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'NEW COFIGURATION',
                    style: GoogleFonts.poppins(
                      color: AppTheme.color,
                      fontWeight: FontWeight.w600,
                      fontSize: w(0.05),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Create Route',
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: w(0.07),
                    ),
                  ),
                ),
                SizedBox(),
                commonField(
                  'ROUTE NAME',
                  'eg: north express',
                  w,
                  h,
                  controller,
                ),
                commonField(
                  'ROUTE NAME',
                  'eg: north express',
                  w,
                  h,
                  controller,
                ),
              ],
            ),
          ),
          SizedBox(height: h(0.02)),
          mainContain(
            w,
            double.infinity,
            h(0.53),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Waypoints',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.06),
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Add stop along the path',
                  style: GoogleFonts.poppins(
                    fontSize: w(0.04),
                    fontWeight: FontWeight.w600,
                    color: AppTheme.color,
                  ),
                ),
                SizedBox(height: h(0.03)),
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WayPoint()),
                    );
                  },
                  child: mainContain(
                    w,
                    double.infinity,
                    h(0.15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: const Color.fromARGB(255, 167, 67, 0),
                          size: w(0.09),
                        ),
                        Text(
                          'CLICK ON MAP TO DROP WAYPOINT',
                          style: GoogleFonts.poppins(
                            fontSize: w(0.03),
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 163, 65, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: h(0.02)),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return stopTile(
                        h,
                        w,
                        index,
                        'GRANT CENTRAL TERMINAL',
                        'PRIMARY HUB',
                      );
                    },
                  ),
                ),
              ],
            ),
            AppColors.ltOrange,
          ),
          SizedBox(height: h(0.02)),

          Container(
            width: double.infinity,
            height: h(0.07),
            decoration: BoxDecoration(
              color: AppTheme.color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    109,
                    109,
                    109,
                  ).withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'INITIALIZE ROUTE',
                style: GoogleFonts.poppins(
                  fontSize: w(0.05),
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
