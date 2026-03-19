import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/features/intro/presentation/widgets/text.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: h(0.05)),
            Image.asset('assets/buss.jpg', width: w(0.7)),
            SizedBox(height: h(0.03)),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: w(0.05),
                  vertical: h(0.03),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 218, 218, 218),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: h(0.01)),
                    CircleAvatar(
                      backgroundColor: AppTheme.color,
                      radius: w(0.1),
                      child: Center(
                        child: Image.asset(
                          'assets/bus-removebg-preview.png',
                          width: w(0.1),
                        ),
                      ),
                    ),
                    textIntro('Your Commute,', w(0.08), Colors.black),
                    textIntro('Simplified.', w(0.08)),
                    SizedBox(
                      child: Column(
                        children: [
                          textStart(
                            'Real-time bus tracking and smart trip',
                            w(0.03),
                          ),
                          textStart('planning for your daily urban', w(0.03)),
                          textStart('adventures.', w(0.03)),
                        ],
                      ),
                    ),

                    Container(
                      width: w(0.7),
                      height: h(0.07),
                      decoration: BoxDecoration(
                        color: AppTheme.color,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: w(0.04)),
                            Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: w(0.06),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: w(0.05)),
                            CircleAvatar(
                              radius: w(0.06),
                              backgroundColor: Colors.white,
                              child: Center(
                                child: SvgPicture.asset('assets/svg/circlesvg.svg',width: w(0.08),),
                        
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: h(0.02)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
