import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

class ReviewActionButtons extends StatelessWidget {
  const ReviewActionButtons({
    super.key,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(child: _button("Comment")),
            const SizedBox(width: 6),

            Expanded(child: _button("Answer")),
            const SizedBox(width: 6),

            Expanded(child: _button("Explanation")),

            const SizedBox(width: 8),

            _favoriteButton(),
          ],
        );
      },
    );
  }

  Widget _button(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.green,
        side: const BorderSide(color: AppColors.green),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: FittedBox(fit: BoxFit.scaleDown, child: Text(text, maxLines: 1)),
    );
  }

  Widget _favoriteButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onFavoriteToggle,
      child: Container(
        width: 36,
        height: 36,
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
    );
  }
}
