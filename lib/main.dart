import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_track_flutter/features/presentation/view/login.dart';
import 'package:transit_track_flutter/features/presentation/view/signup.dart';
import 'package:transit_track_flutter/features/presentation/view/splash.dart';
import 'package:transit_track_flutter/features/presentation/view/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Start()),
    );
  }
}
