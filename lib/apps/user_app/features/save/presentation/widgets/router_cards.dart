import 'package:flutter/material.dart';
import 'package:transit_track_flutter/apps/user_app/features/profile/domain/entities.dart';
import 'package:transit_track_flutter/core/constants/theme/colors.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class RouterCards extends StatelessWidget {
  final RouteEntity route;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const RouterCards({
    super.key,
    required this.route,
    required this.onTap,
    required this.onFavoriteTap,
  });

  // Color get _statusColor {
  //   switch (route.status) {
  //     case BusStatus.onTime:
  //       return AppColors.onTrak;
  //     case BusStatus.delayed:
  //       return AppColors.red;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.colors,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bg),
          boxShadow: [
            BoxShadow(
              color: AppColors.black,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: bus name + status + favorite
            Row(
              children: [
                // Bus icon + route number
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.directions_bus_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                      ),
                      Text(
                        route.routeNumber,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    // color: _statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    // route.statusLabel,
                    // style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    //   color: _statusColor,
                    //   fontWeight: FontWeight.w700,
                    //   fontSize: 11,
                    // ),
                    "Status",
                  ),
                ),
                const SizedBox(width: 8),
                // Favorite
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Icon(
                    route.isFavorite
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_outline_rounded,
                    color: route.isFavorite ? AppTheme.color : AppTheme.colors,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Route line
            buildRouteLine(context),
            const SizedBox(height: 12),
            // Bottom info
            Row(
              children: [
                infoChip(
                  context,
                  Icons.access_time_outlined,
                  '${route.durationMinutes} min',
                ),
                const SizedBox(width: 12),
                infoChip(
                  context,
                  Icons.event_seat_outlined,
                  '${route.availableSeats} seats',
                ),
                const SizedBox(width: 12),
                infoChip(
                  context,
                  Icons.currency_rupee_rounded,
                  '₹${route.fare.toStringAsFixed(0)}',
                ),
                const Spacer(),
                // Buy ticket button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "buy Ticket",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRouteLine(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "current Stop",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 2),
              Text(
                route.currentStop,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        // Dotted line
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  shape: BoxShape.circle,
                ),
              ),
              ...List.generate(
                4,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 4,
                  height: 2,
                  color: AppColors.black.withOpacity(0.4),
                ),
              ),
              const Icon(
                Icons.directions_bus_rounded,
                color: AppColors.black,
                size: 18,
              ),
              ...List.generate(
                4,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 4,
                  height: 2,
                  color: AppColors.black.withOpacity(0.4),
                ),
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.color, width: 1.5),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("nextStop", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 2),
              Text(
                route.nextStop,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textHint,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget infoChip(BuildContext context, IconData icon, String label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 13, color: AppTheme.textHint),
      const SizedBox(width: 3),
      Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppTheme.textHint,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
