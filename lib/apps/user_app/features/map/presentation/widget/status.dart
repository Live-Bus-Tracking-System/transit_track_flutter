import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/map/presentation/widget/card.dart';

class StatusSection extends StatelessWidget {
  const StatusSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: StatCard(
            icon: Icons.near_me_outlined,
            title: "SPEED",
            value: "40 KM/H",
          ),
        ),

        SizedBox(width: 14),

        Expanded(
          child: StatCard(
            icon: Icons.location_history,
            title: "LOCATION",
            value: "Live",
          ),
        ),

        SizedBox(width: 14),

        Expanded(
          child: StatCard(
            icon: Icons.schedule,
            title: "ETA",
            value: "4 Min",
          ),
        ),
      ],
    );
  }
}