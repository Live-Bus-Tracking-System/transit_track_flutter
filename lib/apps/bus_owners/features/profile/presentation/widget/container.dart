import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget deleteContain(
  double Function(double) size,
  double w,
  double h,
  Widget child, [
  Color color = AppColors.white,
]) {
  return Align(
    alignment: AlignmentGeometry.center,
    child: Container(
      padding: EdgeInsets.all(size(0.08)),
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppTheme.color,
            // blurRadius: 8,
            offset: Offset(-4, 0),
          ),
        ],
      ),
      child: child,
    ),
  );
}
