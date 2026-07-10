import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_task/data/models/tense_model/tense_exam_model.dart';

final tenseSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredTenseExamsProvider = Provider<List<TenseExam>>((ref) {
  final query = ref.watch(tenseSearchQueryProvider).trim().toLowerCase();
  if (query.isEmpty) return TenseExam.sample;
  return TenseExam.sample
      .where((exam) => exam.title.toLowerCase().contains(query))
      .toList();
});
