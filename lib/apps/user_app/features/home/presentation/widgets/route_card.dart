import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class RouteCard extends StatelessWidget {
  final String title;
  final String tag;

  const RouteCard({super.key, required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF4A4A4A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // 🔸 Title Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(tag, style: const TextStyle(color: Colors.orange)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(title, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔸 Buttons Row
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {},
                  child: const Text("Map view"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {},
                  child: const Text("Buses →"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecentRouteChip extends StatelessWidget {
  final RouteEntity route;
  final VoidCallback onTap;

  const RecentRouteChip({super.key, required this.route, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.ltOrange,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.color),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.directions_bus_rounded,
                color: AppTheme.color,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    route.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textHint,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    route.destination,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
