import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';
import 'package:flutter_task/core/theme/app_style.dart';

import '../models/tense_exam.dart';
import 'status_badge.dart';

/// Single exam card: title + status, meta info, topic line, action buttons.
class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
    required this.exam,
    this.onViewQuestions,
    this.onStart,
  });

  final TenseExam exam;
  final VoidCallback? onViewQuestions;
  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(exam.title, style: AppTextStyles.cardTitle)),
              const SizedBox(width: 8),
              StatusBadge(isChecked: exam.isChecked),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Total marks: ${exam.totalMarks}',
                style: AppTextStyles.label,
              ),
              const Spacer(),
              Text(
                'Duration: ${exam.durationMin} min',
                style: AppTextStyles.label,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Total Question - ${exam.totalQuestions}',
                style: AppTextStyles.labelBold,
              ),
              const Spacer(),
              Text(
                'Negative Marks - ${exam.negativeMarks.toStringAsFixed(2)}',
                style: AppTextStyles.labelBold,
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: AppTextStyles.body,
              children: [
                const TextSpan(
                  text: 'Topic : History of Cultural Literature: ',
                ),
                TextSpan(text: exam.topic),
                const TextSpan(
                  text: ' Show More',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onViewQuestions ?? () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View Questions',
                    style: AppTextStyles.buttonOutlined,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: onStart ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purpleDark,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    exam.isChecked ? 'Start Exam' : 'Start Exam Again',
                    style: AppTextStyles.buttonFilled,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
