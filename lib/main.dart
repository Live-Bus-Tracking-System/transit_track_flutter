import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/features/auth/presentation/view/signup.dart';
import 'package:transit_track_flutter/features/intro/presentation/view/splash.dart';
import 'package:transit_track_flutter/features/intro/presentation/view/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
