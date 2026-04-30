import 'package:flutter/material.dart';

Widget TitleHanding(String name, String label) {
  return Column(
    children: [
      Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      Text(
        label,
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
      ),
    ],
  );
}
