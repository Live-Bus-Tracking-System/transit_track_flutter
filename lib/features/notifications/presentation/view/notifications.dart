import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/text.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstText.notification),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}