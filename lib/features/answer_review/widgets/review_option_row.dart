import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';
import 'package:flutter_task/data/models/answer_review/answer_model.dart';

class ReviewOptionRow extends StatelessWidget {
  const ReviewOptionRow({super.key, required this.option});

  final ReviewOption option;

  @override
  Widget build(BuildContext context) {
    final _RowColors colors = switch (option.status) {
      ReviewOptionStatus.correct => const _RowColors(
        AppColors.blueBg,
        AppColors.green,
        AppColors.green,
      ),
      ReviewOptionStatus.wrongSelected => const _RowColors(
        AppColors.redBg,
        AppColors.red,
        AppColors.redText,
      ),
      ReviewOptionStatus.neutral => const _RowColors(
        Colors.transparent,
        Colors.transparent,
        AppColors.textPrimary,
      ),
    };
    final bool highlighted = option.status != ReviewOptionStatus.neutral;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(10),
        border: highlighted ? null : Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: highlighted ? colors.avatarBg : Colors.white,
              shape: BoxShape.circle,
              border: highlighted ? null : Border.all(color: AppColors.border),
            ),
            child: Text(
              option.letter,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: highlighted ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              option.text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: colors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RowColors {
  const _RowColors(this.background, this.avatarBg, this.text);
  final Color background;
  final Color avatarBg;
  final Color text;
}
