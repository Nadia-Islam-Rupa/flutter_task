import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_task/data/models/answer_review/answer_model.dart';

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
