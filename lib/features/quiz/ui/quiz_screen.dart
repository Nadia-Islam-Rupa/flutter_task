import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/theme/app_color.dart';
import 'package:flutter_task/core/widgets/top_app_bar.dart';
import 'package:flutter_task/data/models/quiz/quiz_model.dart';

import '../providers/quiz_providers.dart';
import '../widgets/quiz_level_bar.dart';
import '../widgets/quiz_option_tile.dart';
import '../widgets/quiz_question_card.dart';
import '../widgets/quiz_timer_badge.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  static const QuizQuestion _question = QuizQuestion.sample;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedOptionProvider);
    final secondsLeft = ref.watch(quizTimerProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 600 ? 32.0 : 20.0;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTopBar(
                    title: 'Flashcard',
                    onBack: () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'No of Questuon',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      QuizTimerBadge(secondsLeft: secondsLeft),
                    ],
                  ),
                  const SizedBox(height: 14),
                  QuizQuestionCard(question: _question.question),
                  const SizedBox(height: 20),
                  QuizLevelBar(
                    current: _question.currentLevel,
                    total: _question.totalLevel,
                  ),
                  const SizedBox(height: 18),
                  ..._question.options.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: QuizOptionTile(
                        letter: entry.key,
                        text: entry.value,
                        selected: selected == entry.key,
                        onTap: () =>
                            ref.read(selectedOptionProvider.notifier).state =
                                entry.key,
                      ),
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
