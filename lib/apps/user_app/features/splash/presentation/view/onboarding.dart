import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/intro_first.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/intro_second.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/view/landing.dart';
import 'package:transit_track_flutter/apps/user_app/features/splash/presentation/widget/buttons.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;
  Timer? _timer;

  final List<Widget> pages = [IntroFirst(), IntroSecond()];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < pages.length - 1) {
        currentPage++;

        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
        Future.delayed(Duration(seconds: 3), () {
          if (!mounted) return;
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, an, _) => Landing(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ThemeDasrkWhite(context),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  currentPage != 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: IconButton(
                            tooltip: "Move back to page",
                            style: IconButton.styleFrom(),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(Icons.arrow_back, color: AppTheme.color),
                          ),
                        )
                      : SizedBox(),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Landing()),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: AppTheme.color, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return pages[index];
                  },
                ),
              ),

              SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppTheme.color,
                  dotColor: const Color.fromARGB(
                    255,
                    108,
                    108,
                    108,
                  ).withOpacity(.4),
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                ),
              ),

              const SizedBox(height: 30),
              IntroActionButton(
                text: "Next",
                onTap: () {
                  if (currentPage == pages.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Landing()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
