import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

/// "Level" row: gray track with a red-to-purple gradient fill, plus a
/// gradient-ringed "current/total" badge at the end.
class QuizLevelBar extends StatelessWidget {
  const QuizLevelBar({super.key, required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : current / total;

    return Row(
      children: [
        const Text(
          'Level',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Container(height: 8, color: AppColors.trackGray),
                FractionallySizedBox(
                  widthFactor: progress.clamp(0, 1),
                  child: Container(
                    height: 8,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: AppColors.levelGradient),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        CustomPaint(
          painter: _GradientRingPainter(),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Text(
                '$current/$total',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GradientRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..shader = const SweepGradient(
        colors: [...AppColors.levelGradient, ...AppColors.levelGradient],
      ).createShader(rect);
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - paint.strokeWidth) / 2;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
