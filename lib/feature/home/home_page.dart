import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Screen Gallery',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 28),
                  // _NavButton(
                  //   label: 'Tense',
                  //   onTap: () => _push(context, const TenseScreen()),
                  // ),
                  // const SizedBox(height: 14),
                  // _NavButton(
                  //   label: 'Flashcard (Create Quiz)',
                  //   onTap: () => _push(context, const QuizScreen()),
                  // ),
                  // const SizedBox(height: 14),
                  // _NavButton(
                  //   label: 'Answer Review',
                  //   onTap: () => _push(context, const AnswerReviewScreen()),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
