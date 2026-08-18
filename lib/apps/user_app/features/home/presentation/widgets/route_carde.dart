import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class RouteCard extends StatelessWidget {
  final String busNo;
  final String busName;
  final String route;
  final String time;

  const RouteCard({
    super.key,
    required this.busNo,
    required this.busName,
    required this.route,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Container(
      padding: EdgeInsets.all(w(0.05)),
      margin: EdgeInsets.only(left: w(0.04)),
      decoration: BoxDecoration(
        color: AppTheme.isDark(context)
            ? const Color.fromARGB(44, 255, 255, 255)
            : const Color.fromARGB(17, 0, 0, 0),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: w(0.025),
              vertical: h(0.003),
            ),
            decoration: BoxDecoration(
              color: AppTheme.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              busNo,
              style: GoogleFonts.inter(
                fontSize: w(0.03),
                color: AppColors.ThemeDasrkWhite(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: h(0.018)),

          Text(
            busName,
            style: GoogleFonts.poppins(
              fontSize: w(0.045),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: h(0.01)),

          Text(
            route,
            style: GoogleFonts.inter(
              fontSize: w(0.03),
              color: AppColors.ThemeWhiteDark(context),
            ),
          ),

          SizedBox(height: h(0.01)),

          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: w(0.03),
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
