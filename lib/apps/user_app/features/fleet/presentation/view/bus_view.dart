import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/fleet/data/model/route_stop_model.dart';
import 'package:transit_track_flutter/apps/user_app/features/fleet/presentation/view/header.dart';
import 'package:transit_track_flutter/apps/user_app/features/fleet/presentation/widget/card.dart';
import 'package:transit_track_flutter/apps/user_app/features/fleet/presentation/widget/menu.dart';

class BusDetailsPage extends StatelessWidget {
  BusDetailsPage({super.key});

  final stops = const [
    RouteStop(
      name: "Vytila Bus Stand",
      time: "10:45 AM",
      completed: true,
    ),
    RouteStop(
      name: "Ponnurunni",
      time: "10:52 AM",
      completed: true,
    ),
    RouteStop(
      name: "Geethanjali",
      time: "11:06 AM",
      current: true,
    ),
    RouteStop(
      name: "Chakkaraparambu",
      time: "11:24 AM",
    ),
    RouteStop(
      name: "Puthiya Road",
      time: "11:38 AM",
    ),
    RouteStop(
      name: "Convent",
      time: "11:58 AM",
    ),
    RouteStop(
      name: "Malta",
      time: "12:17 PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),

              const SizedBox(height: 20),

              const BusInfoCard(),

              const SizedBox(height: 24),

              const ActionMenuCard(),

              const SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * .05,
                ),
                child: RouteTimeline(
                  stops: stops,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}