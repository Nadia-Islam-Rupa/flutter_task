import 'package:flutter_riverpod/legacy.dart';
import '../models/review_question.dart';

/// Favorite (heart) toggle state per question number, seeded from the
/// static sample data's initial isFavorite flags.
final reviewFavoritesProvider =
    StateNotifierProvider<ReviewFavoritesNotifier, Map<int, bool>>(
      (ref) => ReviewFavoritesNotifier(),
    );

class ReviewFavoritesNotifier extends StateNotifier<Map<int, bool>> {
  ReviewFavoritesNotifier()
    : super({for (final q in ReviewQuestion.sample) q.number: q.isFavorite});

  void toggle(int questionNumber) {
    state = {...state, questionNumber: !(state[questionNumber] ?? false)};
  }
}
