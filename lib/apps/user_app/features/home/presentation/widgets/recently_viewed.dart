import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/route_carde.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h(0.02)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w(0.05)),
            child: Text(
              "Recently Viewed",
              style: GoogleFonts.poppins(
                color: AppColors.ThemeWhiteDark(context),
                fontSize: w(0.042),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h(0.02)),

                Row(
                  children: const [
                    RouteCard(
                      busNo: "KL12",
                      busName: "Krishna",
                      route: "Vyttila → Aluva",
                      time: "3 min ago",
                    ),

                

                    RouteCard(
                      busNo: "KL40",
                      busName: "Sreelam",
                      route: "Kollam → Alappuzha",
                      time: "9 min ago",
                    ),

                    RouteCard(
                      busNo: "KL40",
                      busName: "Sreelam",
                      route: "Kollam → Alappuzha",
                      time: "9 min ago",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
