import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget logoIcon(double Function(double) w) {
  return Center(
    child: Container(
      width: w(1),
      height: w(0.2),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.color.withOpacity(.35),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
        ],
        color: AppTheme.color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset('assets/bus-removebg-preview.png',width: w(0.12),)
      ),
    ),
  );
}
