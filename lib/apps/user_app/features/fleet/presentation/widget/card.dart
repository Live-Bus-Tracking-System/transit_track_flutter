import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusInfoCard extends StatelessWidget {
  const BusInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * .05),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Row(
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
                  size: 32,
                ),
              ),

              const SizedBox(width: 14),

               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "STRANGER",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),

                    Text(
                      "Vytila Hub → Aluva",
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
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
            ],
          ),

          const SizedBox(height: 22),

          const Row(
            children: [
              Text(
                "Current Stop : ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text("Palarivattam"),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Text(
                "Next Stop : ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),

              const Expanded(
                child: Text("Edappally"),
              ),

              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 8),

              const Text(
                "Online",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}