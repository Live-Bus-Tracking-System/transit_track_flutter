import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Padding(
      padding: EdgeInsets.all(w(0.04)),
      child: Row(
        children: [
          Container(
            width: w(0.1),
            height: h(0.05),
            decoration: BoxDecoration(
              color: AppTheme.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.directions_bus, color: Colors.white),
          ),

          SizedBox(width: w(0.04)),

          Expanded(
            child: Text(
              "TransitTrack",
              style: GoogleFonts.poppins(
                color: AppColors.ThemeWhiteDark(context),
                fontSize: w(0.04),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: AppTheme.isDark(context)
                  ? Icon(
                      Icons.light_mode_outlined,
                      size: w(0.055),
                      color: AppColors.ThemeWhiteDark(context),
                    )
                  : Icon(
                      Icons.dark_mode_outlined,
                      size: w(0.055),
                      color: AppColors.ThemeWhiteDark(context),
                    ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: w(0.05),
              color: AppColors.ThemeWhiteDark(context),
            ),
          ),

          CircleAvatar(
            radius: w(0.035),
            backgroundColor: AppColors.ThemeWhiteDark(context),
          ),
        ],
      ),
    );
  }
}
