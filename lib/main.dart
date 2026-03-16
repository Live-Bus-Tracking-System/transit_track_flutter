import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/presentation/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash());
  }
}
