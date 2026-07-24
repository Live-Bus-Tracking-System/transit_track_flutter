import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/action.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/header.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/popular.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/recently_viewed.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> hai() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double h) => size.height * h;
    double w(double w) => size.width * w;
    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            return hai();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: SizedBox(
                    width: w(0.845),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(0.04)),
                      child: DefaultTextStyle(
                        style: GoogleFonts.poppins(
                          fontSize: w(0.075),
                          fontWeight: FontWeight(700),
                          color: AppColors.ThemeWhiteDark(context),
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Hello, Welcome to TransitTrack!",
                              speed: Duration(milliseconds: 250),
                            ),
                          ],

                          isRepeatingAnimation: false,
                          repeatForever: false,
                        ),
                      ),
                    ),
                  ),
                ),
                RecentlyViewedSection(),
                QuickActionsSection(),
                PopularRoutesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
