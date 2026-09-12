import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconOptionTile extends StatelessWidget {
  const IconOptionTile({super.key, 
    required this.icon,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  final IconData icon;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: selected ? selectedColor.withValues(alpha: 0.16) : colors.surfaceAlt,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: selected ? selectedColor : colors.border),
        ),
        child: Icon(icon, size: 20, color: selected ? selectedColor : Theme.of(context).iconTheme.color),
      ),
    );
  }
}
