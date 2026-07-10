import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/theme/app_color.dart';
import 'package:flutter_task/core/widgets/icon_button_circle.dart';
import 'package:flutter_task/core/widgets/top_app_bar.dart';
import 'package:flutter_task/data/models/answer_review/answer_model.dart';

import '../providers/review_providers.dart';
import '../widgets/review_question_card.dart';

/// Answer Review screen: header, exam title + filter, and a scrollable
/// list of reviewed question cards. Matches
/// assets/Right and wrong answer.png.
class AnswerReviewScreen extends ConsumerWidget {
  const AnswerReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(reviewFavoritesProvider);
    final favoritesNotifier = ref.read(reviewFavoritesProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 600 ? 32.0 : 20.0;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTopBar(
                    title: 'Answer Review',
                    onBack: () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          '41st BCS Culture - 2025 (21 Aug)',
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleIconButton(
                        icon: Icons.tune,
                        background: AppColors.purpleDark,
                        iconColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: ReviewQuestion.sample.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final question = ReviewQuestion.sample[index];
                        return ReviewQuestionCard(
                          question: question,
                          isFavorite: favorites[question.number] ?? false,
                          onFavoriteToggle: () =>
                              favoritesNotifier.toggle(question.number),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
