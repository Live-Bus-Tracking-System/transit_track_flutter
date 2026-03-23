import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/auth/view/login.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/intro/view/landing.dart';




void main() {
  runApp(const UserApp());
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Landing());
  }
}
