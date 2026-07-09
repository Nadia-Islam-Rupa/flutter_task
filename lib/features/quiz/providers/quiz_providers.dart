import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

/// Letter key ('A'..'E') of the option currently selected on the Flashcard
/// screen. Pre-seeded to 'C' to match the mockup's selected state.
final selectedOptionProvider = StateProvider<String?>((ref) => 'C');

/// Simple mm:ss countdown starting at 30 seconds, shown next to the
/// question header. Ticks every second until it reaches zero.
final quizTimerProvider =
    StateNotifierProvider.autoDispose<QuizTimerNotifier, int>(
      (ref) => QuizTimerNotifier(),
    );

class QuizTimerNotifier extends StateNotifier<int> {
  QuizTimerNotifier() : super(30) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state > 0) state = state - 1;
    });
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
