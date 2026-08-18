import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height * 0.12,
      constraints: const BoxConstraints(minHeight: 90, maxHeight: 140),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: size.width * 0.06),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.028,
              fontWeight: FontWeight.w500,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextStopCard extends StatelessWidget {
  final String stopName;

  const NextStopCard({super.key, required this.stopName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            "Next Stop",
            style: TextStyle(
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: size.height * 0.005),

          Text(
            stopName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size.width * 0.075,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
