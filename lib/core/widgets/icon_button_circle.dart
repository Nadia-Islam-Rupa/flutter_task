import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.background = AppColors.iconCircleBg,
    this.iconColor = AppColors.textPrimary,
    this.size = 44,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color background;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: iconColor, size: size * 0.42),
        ),
      ),
    );
  }
}
