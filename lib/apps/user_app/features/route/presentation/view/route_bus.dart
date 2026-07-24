import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/presentation/view/header.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/data/model/active_bus.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/presentation/widget/card.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/presentation/widget/route_header.dart';

class RouteBusesPage extends StatelessWidget {
  RouteBusesPage({super.key});

  final buses = const [
    ActiveBus(
      name: "STRANGER",
      regNo: "KL07B1001",
      route: "Vytila Hub → Aluva",
      nextStop: "Idappally",
      online: true,
      color: Color(0xffFF6B6B),
    ),
    ActiveBus(
      name: "MARIYA",
      regNo: "KL08B1001",
      route: "Kollam → Alappuzha",
      nextStop: "Aroor",
      online: false,
      color: Color(0xffF7C63D),
    ),
    ActiveBus(
      name: "STRANGER",
      regNo: "KL08B0101",
      route: "Vytila Hub → Aluva",
      nextStop: "Idappally",
      online: true,
      color: Color(0xff4BE2C1),
    ),
    ActiveBus(
      name: "MARIYA",
      regNo: "KL08B1001",
      route: "Kollam → Alappuzha",
      nextStop: "Aroor",
      online: false,
      color: Color(0xff9B4DFF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: Column(
          children: [
            const Header(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(w * .05),
                child: Column(
                  children: [
                    RouteHeaderCard(
                      totalBuses: buses.length,
                    ),

                    const SizedBox(height: 24),

                    ...buses.map(
                      (bus) => Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: ActiveBusCard(
                          bus: bus,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}