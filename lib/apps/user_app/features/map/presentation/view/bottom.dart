import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/widget/card.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/widget/info.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/widget/status.dart';

class BottomPanel extends StatelessWidget {
  final double height;

  const BottomPanel({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(50),
              ),
            ),

            const SizedBox(height: 18),

            const BusInfo(),

            const SizedBox(height: 20),

            const StatusSection(),

            const SizedBox(height: 22),

            const NextStopCard(stopName: "Mallappally",),
          ],
        ),
      ),
    );
  }
}
