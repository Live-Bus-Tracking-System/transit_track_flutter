import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/fleet/presentation/view/add_bus.dart';
import 'package:transit_track_flutter/apps/user_app/features/bottom/view/bottom_bar.dart';




void main() {
  runApp(const UserApp());
}
class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Fleet(),
    );
  }
}
