import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class IntroSecond extends StatefulWidget {
  const IntroSecond({super.key});

  @override
  State<IntroSecond> createState() => _IntroSecondState();
}

class _IntroSecondState extends State<IntroSecond> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: h(0.5),
              margin: EdgeInsets.symmetric(horizontal: w(0.15)),

              decoration: BoxDecoration(
                color: AppColors.ThemeDasrkWhite(context),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      38,
                      128,
                      128,
                      128,
                    ).withOpacity(.25),
                    blurRadius: 40,
                    spreadRadius: 10,
                    offset: Offset(0, 50),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: h(0.12),
                    padding: EdgeInsets.all(w(0.06)),
                    decoration: BoxDecoration(
                      color: AppTheme.color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "METRO EXPRESS",
                              style: GoogleFonts.poppins(
                                color: AppColors.ThemeDasrkWhite(context),
                                fontSize: w(0.03),
                                fontWeight: FontWeight(400),
                              ),
                            ),
                            Text(
                              "Terminal 3",
                              style: GoogleFonts.poppins(
                                color: AppColors.ThemeDasrkWhite(context),
                                fontSize: w(0.055),
                                fontWeight: FontWeight(650),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: w(0.09),
                          height: h(0.06),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 255, 255, 255),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.directions_bus,
                              color: AppColors.ThemeDasrkWhite(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(w(0.06)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Gate",
                                    style: GoogleFonts.inter(
                                      fontSize: w(0.03),
                                      color: AppColors.ThemeWhiteDark(context),
                                    ),
                                  ),
                                  Text(
                                    "A56",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight(650),
                                      color: AppColors.ThemeWhiteDark(context),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Seat",
                                    style: GoogleFonts.inter(
                                      fontSize: w(0.03),
                                      color: AppColors.ThemeWhiteDark(context),
                                    ),
                                  ),
                                  Text(
                                    "X56",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight(650),
                                      color: AppColors.ThemeWhiteDark(context),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Container(
                            width: double.infinity,
                            height: h(0.23),
                            padding: EdgeInsets.all(w(0.06)),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 216, 216, 216),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset("assets/qrcode.png"),
                            ),
                          ),
                          Text(
                            "BOARDING PASS ID: 8829-QX",
                            style: GoogleFonts.inter(
                              fontSize: w(0.03),
                              color: const Color.fromARGB(255, 135, 135, 135),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Text(
              "Book & Board in\n Seconds",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: w(0.06),
                color: AppColors.ThemeWhiteDark(context),
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              textAlign: TextAlign.center,
              "Say goodbye to paper tickets. Buy,\n store, and scan your boarding passes directly\n from your phone.",
              style: GoogleFonts.inter(
                color: const Color.fromARGB(255, 146, 146, 146),
                fontSize: w(0.03),
              ),
            ),
          ],
        ),
        Positioned(
          right: w(0.02),
          top: h(0.02),
          child: Transform.rotate(
            angle: 10 * 3.14159 / 180,
            child: Container(
              width: w(0.3),
              height: h(0.05),
              decoration: BoxDecoration(
                color: AppColors.ThemeDasrkWhite(context),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.3),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: w(0.05),
                    color: const Color.fromARGB(255, 0, 201, 7),
                  ),
                  Text(
                    "Purchased",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight(500),
                      color: AppColors.ThemeWhiteDark(context),
                      fontSize: w(0.025),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: h(0.44),
          child: Transform.rotate(
            angle: -10 * 3.14159 / 180,
            child: Container(
              width: w(0.32),
              height: h(0.06),
              decoration: BoxDecoration(
                color: AppColors.ThemeDasrkWhite(context),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(.1),
                    blurRadius: 30,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.wallet,
                    size: w(0.05),
                    color: const Color.fromARGB(255, 142, 57, 0),
                  ),
                  Text(
                    "In Wallet",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight(500),
                      color: AppColors.ThemeWhiteDark(context),
                      fontSize: w(0.03),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
