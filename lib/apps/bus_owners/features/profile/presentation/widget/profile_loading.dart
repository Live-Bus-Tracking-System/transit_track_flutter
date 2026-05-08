import 'package:flutter/widgets.dart';
import 'package:transit_track_flutter/apps/bus_owners/features/profile/presentation/widget/shimmer.dart';

Widget profileShimmer(double Function(double) h, double Function(double) w) {
  return ListView(
    padding: EdgeInsets.all(w(0.052)),
    children: [
      SizedBox(height: h(0.04)),

      // Profile image
      Center(
        child: shimmerBox(width: w(0.25), height: h(0.1)),
      ),

      SizedBox(height: h(0.02)),

      // Name
      Center(child: shimmerBox(width: w(0.4), height: 20)),

      SizedBox(height: 10),

      // Role
      Center(child: shimmerBox(width: w(0.3), height: 14)),

      SizedBox(height: h(0.02)),

      // Info card
      shimmerBox(width: double.infinity, height: h(0.15)),

      SizedBox(height: h(0.02)),

      // System status card
      shimmerBox(width: double.infinity, height: h(0.17)),

      SizedBox(height: h(0.02)),

      shimmerBox(width: w(0.5), height: 25),

      SizedBox(height: h(0.02)),

      // FULL NAME card
      shimmerBox(width: double.infinity, height: h(0.14)),

      SizedBox(height: h(0.02)),

      // EMAIL card
      shimmerBox(width: double.infinity, height: h(0.14)),

      SizedBox(height: h(0.02)),

      // PHONE card
      shimmerBox(width: double.infinity, height: h(0.14)),

      SizedBox(height: h(0.02)),

      // Delete button
      shimmerBox(width: double.infinity, height: 60),
    ],
  );
}
