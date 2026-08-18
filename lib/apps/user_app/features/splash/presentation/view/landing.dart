import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/bloc/splash_bloc_bloc.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/widget/text.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';
import 'package:transit_track_flutter/core/widget/logo.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  double scale = 1;

  void tap() async {
    setState(() => scale = .95);
    await Future.delayed(Duration(milliseconds: 100));
    setState(() => scale = 1);

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double h(double value) => size.height * value;
    double w(double value) => size.width * value;
    return BlocListener<SplashBlocBloc, SplashBlocState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: AppColors.ThemeDasrkWhite(context),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: AppTheme.color),
                      ),
                    ),
                  ),
                  SizedBox(height: h(0.35)),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: w(0.05),
                        vertical: h(0.03),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.ThemeDasrkWhite(context),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              97,
                              82,
                              82,
                              82,
                            ).withOpacity(.25),
                            blurRadius: 40,
                            spreadRadius: 0,
                            offset: Offset(0, -80),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: h(0.01)),
                          logoIcon(w),
                          textIntro(
                            'Your Commute,',
                            w(0.08),
                            AppColors.ThemeWhiteDark(context),
                          ),
                          textIntro('Simplified.', w(0.08)),
                          SizedBox(
                            child: Column(
                              children: [
                                textStart(
                                  'Real-time bus tracking and smart trip',
                                  w(0.03),
                                ),
                                textStart(
                                  'planning for your daily urban',
                                  w(0.03),
                                ),
                                textStart('adventures.', w(0.03)),
                              ],
                            ),
                          ),

                          AnimatedScale(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeOutBack,
                            scale: scale,
                            child: GestureDetector(
                              onTap: tap,

                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 280),
                                width: w(0.7),
                                height: h(0.07),
                                decoration: BoxDecoration(
                                  color: AppTheme.color,
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFFF8A00), AppTheme.color],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.color.withOpacity(.35),
                                      blurRadius: 25,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: w(0.04)),
                                      Text(
                                        'Get Started',
                                        style: GoogleFonts.poppins(
                                          color: AppColors.ThemeDasrkWhite(
                                            context,
                                          ),
                                          fontSize: w(0.06),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: w(0.05)),
                                      CircleAvatar(
                                        radius: w(0.06),
                                        backgroundColor:
                                            AppColors.ThemeDasrkWhite(context),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/svg/circlesvg.svg',
                                            width: w(0.08),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
              Positioned(
                top: h(0.07),
                left: 0,
                right: 0,
                child: Align(
                  alignment: AlignmentGeometry.center,
                  child: Image.asset("assets/buss.jpg", width: w(0.7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
