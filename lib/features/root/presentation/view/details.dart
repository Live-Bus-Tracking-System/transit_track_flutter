
import 'package:flutter/material.dart';
import 'package:transit_track_flutter/features/root/presentation/widgets/action_item.dart';
import 'package:transit_track_flutter/features/root/presentation/widgets/time_line_tile.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "SRANGER",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.directions_bus, color: Colors.white),
                      ),
                      const SizedBox(width: 10),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("STRANGER",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("Vytila Hub → Aluva",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text("Limited",
                            style: TextStyle(color: Colors.white, fontSize: 12)),
                      )
                    ],
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    children: [
                      Text("Current Stop : "),
                      Text("Palarivattam",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Text("Next Stop : "),
                      const Text("Idappally",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("Online",
                          style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),

             Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ActionItem(icon: Icons.share, label: "Share"),
                  ActionItem(icon: Icons.bookmark, label: "Save Bus"),
                  ActionItem(icon: Icons.confirmation_num, label: "Pay Ticket"),
                  ActionItem(icon: Icons.map, label: "Live Map"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Route Time Line",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),

            const SizedBox(height: 10),

            
            Column(
              children: const [
                TimelineTile("Vytila Bus Stand", "10:45 AM", false),
                TimelineTile("Ponnurunni", "10:52 AM", false),
                TimelineTile("Geethanjali", "11:06 AM", true),
                TimelineTile("Chakkaraparambu", "11:24 AM", true),
                TimelineTile("Puthiya Road", "11:38 AM", true),
                TimelineTile("Convent", "11:58 AM", true),
                TimelineTile("Malta", "12:17 PM", true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}