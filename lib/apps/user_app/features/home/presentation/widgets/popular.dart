import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/popular_route_card.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class PopularRoutesSection extends StatelessWidget {
  const PopularRoutesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w(0.03), vertical: h(0.01)),
      padding: EdgeInsets.all(w(0.04)),
      decoration: BoxDecoration(
        color: AppColors.ThemeDasrkWhite(context),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          width: 1.5,
          color: AppTheme.isDark(context)
              ? const Color.fromARGB(47, 255, 255, 255)
              : const Color.fromARGB(255, 231, 231, 231),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular routes",
            style: GoogleFonts.poppins(
              fontSize: w(0.042),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: h(0.02)),

          const PopularRouteCard(
            busNo: "M2",
            route: "Vyttila Hub Stand → Guruvayoor",
          ),

          const PopularRouteCard(
            busNo: "M1",
            route: "Guruvayoor → Vyttila Hub Stand",
          ),
        ],
      ),
    );
  }
}
