import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/colors.dart';

Widget overContainer(
  double width,
  double height,
  Widget child,
  double padding,
  [Color bg=AppColors.white]
) {
  return Container(
    padding: EdgeInsets.all(padding),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 109, 109, 109).withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: child,
  );
}
