import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Container(
      margin: EdgeInsets.all(w(0.04)),

      padding: EdgeInsets.symmetric(vertical: h(0.02)),

      decoration: BoxDecoration(
        color: AppColors.ThemeDasrkWhite(context),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: AppTheme.isDark(context)
                ? const Color.fromARGB(255, 255, 255, 255).withOpacity(.25)
                : const Color.fromARGB(255, 142, 142, 142).withOpacity(.35),
          ),
        ],
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionItem(Icons.share_outlined, "Share"),
          ActionItem(Icons.currency_rupee, "Your Payments"),
          ActionItem(Icons.bookmark_border, "Saved Busses"),
        ],
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ActionItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Column(
      children: [
        Icon(icon, size: w(0.045), color: AppColors.ThemeWhiteDark(context)),

        SizedBox(height: h(0.013)),

        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: w(0.025),
            color: AppColors.ThemeWhiteDark(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
