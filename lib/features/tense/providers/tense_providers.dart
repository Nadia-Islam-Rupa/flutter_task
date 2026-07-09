import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/tense_exam.dart';

/// Current text typed into the Tense screen search bar.
final tenseSearchQueryProvider = StateProvider<String>((ref) => '');

/// Exam list filtered by [tenseSearchQueryProvider] (matched on title).
final filteredTenseExamsProvider = Provider<List<TenseExam>>((ref) {
  final query = ref.watch(tenseSearchQueryProvider).trim().toLowerCase();
  if (query.isEmpty) return TenseExam.sample;
  return TenseExam.sample
      .where((exam) => exam.title.toLowerCase().contains(query))
      .toList();
});
