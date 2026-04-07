import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/auth/presentation/view/login.dart';
import 'package:transit_track_flutter/features/bottom/view/bottom_bar.dart';
import 'package:transit_track_flutter/features/intro/presentation/view/landing.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/save/view/save.dart';




void main() {
  runApp(const UserApp());
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const BottomBar());
  }
}
