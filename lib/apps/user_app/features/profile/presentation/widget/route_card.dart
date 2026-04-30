import 'package:flutter/material.dart';
import 'package:transit_track_flutter/core/constants/theme/theme.dart';

Widget buildMenuGroup(List<MenuItem> items) {
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.colors,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.colors),
    ),
    child: Column(
      children: items.asMap().entries.map((e) {
        final item = e.value;
        final isLast = e.key == items.length - 1;
        return Column(
          children: [
            GestureDetector(
              onTap: item.onTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppTheme.color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(item.icon, color: AppTheme.colors, size: 20),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        item.label ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppTheme.color,
                        ),
                      ),
                    ),
                    if (item.trailing != null)
                      item.trailing!
                    else if (item.trailingText != null)
                      Text(
                        item.trailingText!,
                        style: const TextStyle(
                          color: AppTheme.colors,
                          fontSize: 13,
                        ),
                      )
                    else
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: AppTheme.textHint,
                      ),
                  ],
                ),
              ),
            ),
            if (!isLast) const Divider(height: 1, indent: 68),
          ],
        );
      }).toList(),
    ),
  );
}

class MenuItem {
  final IconData? icon;
  final String? label;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? trailingText;

  MenuItem({
    this.icon,
    this.label,
    this.onTap,
    this.trailing,
    this.trailingText,
  });
}
