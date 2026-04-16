import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  final double h;
  final double w;
  const LoadingShimmer({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 225, 225, 225),
      highlightColor: const Color.fromARGB(255, 159, 159, 159),
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
