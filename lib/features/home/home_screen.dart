import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_color.dart';

import '../answer_review/answer_review_screen.dart';
import '../quiz/quiz_screen.dart';
import '../tense/ui/tense_screen.dart';

/// Simple menu so each mocked screen can be opened and navigated to
/// independently for review/testing.
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
                  _NavButton(
                    label: 'Tense',
                    onTap: () => _push(context, const TenseScreen()),
                  ),
                  const SizedBox(height: 14),
                  _NavButton(
                    label: 'Flashcard (Create Quiz)',
                    onTap: () => _push(context, const QuizScreen()),
                  ),
                  const SizedBox(height: 14),
                  _NavButton(
                    label: 'Answer Review',
                    onTap: () => _push(context, const AnswerReviewScreen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.purpleDark,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
