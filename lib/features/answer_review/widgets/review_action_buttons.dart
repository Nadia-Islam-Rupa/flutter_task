import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

/// Comment / Answer / Explanation outlined pill buttons plus a favorite
/// heart toggle, shown at the bottom of each reviewed question card.
class ReviewActionButtons extends StatelessWidget {
  const ReviewActionButtons({
    super.key,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  static const List<String> _labels = ['Comment', 'Answer', 'Explanation'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._labels.map(
          (label) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.green,
                side: const BorderSide(color: AppColors.green),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onFavoriteToggle,
          child: Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isFavorite ? AppColors.red : AppColors.green,
              ),
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: isFavorite ? AppColors.red : AppColors.green,
            ),
          ),
        ),
      ],
    );
  }
}
