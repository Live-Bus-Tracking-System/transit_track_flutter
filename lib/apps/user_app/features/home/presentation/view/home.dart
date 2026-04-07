import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/notification/presentation/view/notifications.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/presentation/widget/route_card.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/presentation/widgets/action_item.dart';

import 'package:transit_track_flutter/apps/user_app/features/save/presentation/view/save.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/apps/user_app/features/home/presentation/widgets/route_card.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey,
      appBar: AppBar(
        leading: Container(
          height: 30,
          width: 30,
          color: AppTheme.color,
          child: Icon(Icons.directions_bus_filled_outlined),
        ),
        title: Text("TransitTrack"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
      
                },
                icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Notifications()),
                  );
                },
                icon: Icon(Icons.notifications),
              ),
              CircleAvatar(),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recently Viewed",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: routeCard(
                    "KL12",
                    "Krishna",
                    "Vyttila → Aluva",
                    "3 min ago",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: routeCard(
                    "KL40",
                    "Sreelam",
                    "Kollam → Alappuzha",
                    "9 min ago",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionItem(
                    icon: Icons.share,
                    label: "Shave",
                    function: () {},
                  ),
                  ActionItem(
                    icon: Icons.bookmark,
                    label: "Save Bus",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Save()),
                      );
                    },
                  ),
                  ActionItem(
                    icon: Icons.currency_rupee_sharp,
                    label: "Pay Ticket",
                    function: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppTheme.colors),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Popular routes",
                      style: TextStyle(
                        color: AppTheme.colors,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Route Cards
                    const RouteCard(
                      title: "Vyttila Hub Stand → Guruvayoor",
                      tag: "M2",
                    ),
                    const SizedBox(height: 10),
                    const RouteCard(
                      title: "Guruvayoor → Vyttila Hub Stand",
                      tag: "M1",
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
