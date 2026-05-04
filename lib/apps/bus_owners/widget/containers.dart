import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';

Widget mainContain(
  double Function(double) size,
  double w,
  double h,
  Widget child, [
  Color color = AppColors.white,
]) {
  return Align(
    alignment: AlignmentGeometry.center,
    child: Container(
      padding: EdgeInsets.all(size(0.06)),
      margin: EdgeInsets.symmetric(horizontal: size(0.04)),
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 109, 109, 109).withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    ),
  );
}
