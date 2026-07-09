import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

/// Red dot + mm:ss countdown text shown top-right of the question header.
class QuizTimerBadge extends StatelessWidget {
  const QuizTimerBadge({super.key, required this.secondsLeft});

  final int secondsLeft;

  @override
  Widget build(BuildContext context) {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.red,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$minutes:$seconds',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
