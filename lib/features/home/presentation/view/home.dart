import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/notifications/presentation/view/notifications.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/root/widgets/action_item.dart';
import 'package:transit_track_flutter/apps/user_app/presentation/save/view/save.dart';
import 'package:transit_track_flutter/core/constants/text.dart';
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
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
             color: AppTheme.color,
            borderRadius: BorderRadius.circular(20)
          ),
          height: h*0.3,
          width: w*0.3,
         
          child: Icon(Icons.directions_bus_filled_outlined),
        ),
        title: Text(ConstText.transitTrack),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
      
                },
                icon: Icon(Icons.light_mode),
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
              padding: EdgeInsets.all(w*0.03),
              child: Text(
                ConstText.recentlyViewed,
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
                 SizedBox(width: w*0.03),
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
            SizedBox(height: h*0.003),
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
             SizedBox(height: h*0.002),
            Expanded(
              child: Container(
                padding:  EdgeInsets.all(w*0.012),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppTheme.colors),
                ),
                child: Column(
                  children: [
                    const Text(
                      ConstText.popularRoutes,
                      style: TextStyle(
                        color: AppTheme.colors,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(height: h*0.02),
                    // Route Cards
                    const RouteCard(
                      title: "Vyttila Hub Stand → Guruvayoor",
                      tag: "M2",
                    ),
                     SizedBox(height: h*0.02),
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
