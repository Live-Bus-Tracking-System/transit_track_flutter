import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme.dart';
import 'package:transit_track_flutter/features/home/presentation/widgets/route_card.dart';
import 'package:transit_track_flutter/features/profile/presentation/widget/route_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
              IconButton(onPressed: () {}, icon: Icon(Icons.sunny)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              CircleAvatar(),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recently Viewed"),
            SizedBox(height: 20),
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
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  
                  height: 70,
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                    color: AppTheme.colors,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.colors),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share, size: 10),
                          ),
                          Text("share", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.currency_rupee, size: 10),
                          ),
                          Text("money", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_border, size: 10),
                          ),
                          Text("share", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
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
