import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transit_track_flutter/apps/user_app/features/route/data/model/active_bus.dart';

class ActiveBusCard extends StatelessWidget {
  final ActiveBus bus;

  const ActiveBusCard({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: bus.color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.directions_bus,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bus.name,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(bus.regNo, style: const TextStyle(fontSize: 13)),

                    const SizedBox(height: 4),

                    Text(bus.route, style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Limited",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Icon(Icons.bookmark_border),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Text(
                "Next Stop : ${bus.nextStop}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Spacer(),

              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bus.online ? Colors.green : Colors.red,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                bus.online ? "Online" : "Offline",
                style: TextStyle(
                  color: bus.online ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
