import 'package:flutter/material.dart';

class RouteHeaderCard extends StatelessWidget {
  final int totalBuses;

  const RouteHeaderCard({
    super.key,
    required this.totalBuses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.directions_bus,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  "Active Buses on This Route",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Vytila Hub Stand → Trissur",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "$totalBuses",
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}