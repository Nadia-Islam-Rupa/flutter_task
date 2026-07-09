import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

/// Pill badge showing "Checked" (blue) or "Unchecked" (red) exam status.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.isChecked});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final Color bg = isChecked ? AppColors.blueBg : AppColors.redBg;
    final Color fg = isChecked ? AppColors.blue : AppColors.redText;
    final IconData icon = isChecked ? Icons.check_circle : Icons.cancel;
    final String label = isChecked ? 'Checked' : 'Unchecked';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: fg),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}
