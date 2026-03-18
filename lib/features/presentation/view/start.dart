import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/features/presentation/widgets/text.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: 70.h),
          Image.asset('assets/buss.jpg', width: 300.w),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 431.7.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.w,
                  color: const Color.fromARGB(255, 218, 218, 218),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20.h),
                  CircleAvatar(
                    backgroundColor: AppTheme.color,
                    radius: 40.r,
                    child: Center(
                      child: Image.asset(
                        'assets/bus-removebg-preview.png',
                        width: 50.w,
                      ),
                    ),
                  ),
                  textIntro('Your Commute,', Colors.black),
                  textIntro('Simplified.'),
                  SizedBox(
                    child: Column(
                      children: [
                        textStart('Real-time bus tracking and smart trip'),
                        textStart('planning for your daily urban'),
                        textStart('adventures.'),
                      ],
                    ),
                  ),
            
                  Container(
                    width: 270.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: AppTheme.color,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 30.r),
                          Text(
                            'Get Started',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          CircleAvatar(
                            radius: 28.r,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Image.asset('assets/circle.png', width: 70.w),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
