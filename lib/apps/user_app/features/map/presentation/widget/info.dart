import 'package:flutter/material.dart';

class BusInfo extends StatelessWidget {
  const BusInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.directions_bus,
            color: Colors.white,
            size: 34,
          ),
        ),

        const SizedBox(width: 14),

        const Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                "STRANGER",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "KL07B1001",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}