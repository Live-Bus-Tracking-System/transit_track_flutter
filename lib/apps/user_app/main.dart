import 'package:flutter/material.dart';

import 'package:transit_track_flutter/apps/user_app/features/bottom_bar/presentation/view/bottom_bar.dart';
import 'package:transit_track_flutter/apps/user_app/features/landing/presentation/view/landing.dart';
import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/save.dart';




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
