import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class IntroFirst extends StatelessWidget {
  const IntroFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          height: h(0.45),
          margin: EdgeInsets.symmetric(horizontal: w(0.06)),
          padding: EdgeInsets.all(w(0.06)),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(108, 98, 98, 98).withOpacity(.25),
                blurRadius: 40,
                spreadRadius: 10,
                offset: Offset(0, 50),
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: w(0.3),
                height: h(0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppTheme.color,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.directions_bus, size: w(0.05)),
                    Text(
                      "4 min ETA",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight(500),
                        fontSize: w(0.03),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // width: w(0.7),
                  height: h(0.1),
                  decoration: BoxDecoration(
                    color: AppColors.ThemeDasrkWhite(context),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppTheme.color),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: w(0.14),
                        height: h(0.07),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 227, 227),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.route,
                            color: const Color.fromARGB(255, 114, 114, 114),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "LINE 42 - NORTHBOUND",
                            style: GoogleFonts.inter(
                              fontSize: w(0.03),
                              color: const Color.fromARGB(255, 112, 112, 112),
                            ),
                          ),
                          Text(
                            "Arriving Soon",
                            style: GoogleFonts.poppins(
                              fontSize: w(0.05),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: w(0.02)),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 45,
                bottom: 240,
                child: CircleAvatar(
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.black,
                      radius: w(0.06),
                      child: Center(
                        child: Icon(
                          Icons.person_outline,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  radius: w(0.08),
                  backgroundColor: const Color.fromARGB(61, 0, 0, 0),
                ),
              ),
              Positioned(
                right: 70,
                bottom: 120,
                child: Transform.rotate(
                  angle: 5 * 3.14159 / 180,
                  child: Container(
                    width: w(0.18),
                    height: h(0.08),
                    decoration: BoxDecoration(
                      color: AppTheme.color,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.color.withOpacity(.35),
                          blurRadius: 25,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/bus-removebg-preview.png",
                        width: w(0.08),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Text(
          "Track Your Ride in Real-Time",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: w(0.06),
            fontWeight: FontWeight.w600,
            color: AppColors.ThemeWhiteDark(context)
          ),
        ),

        Text(
          textAlign: TextAlign.center,
          "Never miss a bus again. Live telemetry\n ensures you're always on time with\n precision ETAs.",
          style: GoogleFonts.inter(
            color: const Color.fromARGB(255, 146, 146, 146),
            fontSize: w(0.035),
          ),
        ),
      ],
    );
  }
}
