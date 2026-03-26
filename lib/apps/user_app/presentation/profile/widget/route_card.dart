import 'package:flutter/material.dart';

Widget routeCard(String bus, String name, String route, String time) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(bus),
          ),

          const SizedBox(height: 5),

          Text(name, style: const TextStyle(color: Colors.white)),

          Text(route, style: const TextStyle(color: Colors.white)),

          const SizedBox(height: 5),

          Text(time, style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }