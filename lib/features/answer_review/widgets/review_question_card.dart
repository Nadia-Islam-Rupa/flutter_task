import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

import '../models/review_question.dart';
import 'review_action_buttons.dart';
import 'review_option_row.dart';

/// One lavender card: question text, its four option rows, and the
/// comment/answer/explanation/favorite action row.
class ReviewQuestionCard extends StatelessWidget {
  const ReviewQuestionCard({
    super.key,
    required this.question,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  final ReviewQuestion question;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.reviewCardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${question.number}.${question.text}',
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          ...question.options.map((o) => ReviewOptionRow(option: o)),
          const SizedBox(height: 2),
          ReviewActionButtons(
            isFavorite: isFavorite,
            onFavoriteToggle: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}
