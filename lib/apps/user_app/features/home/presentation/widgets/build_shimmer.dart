import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget buildShimmer() {
  return Shimmer.fromColors(
    baseColor: AppColors.black,
    highlightColor: AppColors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          3,
          (i) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    ),
  );
}
