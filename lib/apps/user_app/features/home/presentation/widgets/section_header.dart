import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        if (onSeeAll != null)
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              "see All",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
