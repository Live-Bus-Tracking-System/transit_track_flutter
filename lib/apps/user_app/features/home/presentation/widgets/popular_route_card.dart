import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/presentation/view/route_bus.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class PopularRouteCard extends StatelessWidget {
  final String busNo;
  final String route;

  const PopularRouteCard({super.key, required this.busNo, required this.route});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Container(
      margin: EdgeInsets.only(bottom: h(0.02)),
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.ThemeDasrkWhite(context),
        borderRadius: BorderRadius.circular(w(0.03)),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: AppTheme.isDark(context)
                ? const Color.fromARGB(255, 255, 255, 255).withOpacity(.25)
                : const Color.fromARGB(255, 138, 138, 138).withOpacity(.25),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: w(0.12),
                height: h(0.053),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 255, 151, 82),
                  ),
                ),
                child: Center(
                  child: Text(
                    busNo,
                    style: GoogleFonts.poppins(
                      color: AppTheme.color,
                      fontSize: w(0.04),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(width: w(0.05)),

              Expanded(
                child: Text(
                  route,
                  style: GoogleFonts.poppins(
                    color: AppColors.ThemeWhiteDark(context),
                    fontSize: w(0.045),
                    fontWeight: FontWeight(670),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: h(0.02)),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.map_outlined,
                    size: w(0.04),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  label: Text(
                    "Map view",
                    style: GoogleFonts.inter(
                      fontSize: w(0.035),
                      fontWeight: FontWeight(600),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: const Color.fromARGB(255, 207, 207, 207),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                ),
              ),

              SizedBox(width: w(0.024)),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RouteBusesPage()),
                    );
                  },
                  child: Text(
                    "Buses →",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight(600),
                      fontSize: w(0.035),
                      color: AppColors.ThemeDasrkWhite(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
