/// Simple immutable model describing one exam/quiz list item on the
/// Tense screen, plus the static sample data shown in the mockup.
class TenseExam {
  const TenseExam({
    required this.title,
    required this.isChecked,
    required this.totalMarks,
    required this.durationMin,
    required this.totalQuestions,
    required this.negativeMarks,
    required this.topic,
  });

  final String title;
  final bool isChecked;
  final int totalMarks;
  final int durationMin;
  final int totalQuestions;
  final double negativeMarks;
  final String topic;

  static const String _topicText =
      'Vedic Literature, Upanishads, Ramayana Literature ...';

  static const List<TenseExam> sample = [
    TenseExam(
      title: 'Tense Mastery Test 2024',
      isChecked: false,
      totalMarks: 30,
      durationMin: 12,
      totalQuestions: 50,
      negativeMarks: 0.50,
      topic: _topicText,
    ),
    TenseExam(
      title: 'Tense Practice Exam 2024',
      isChecked: true,
      totalMarks: 30,
      durationMin: 12,
      totalQuestions: 50,
      negativeMarks: 0.50,
      topic: _topicText,
    ),
    TenseExam(
      title: 'Future Tense Quiz 2024',
      isChecked: false,
      totalMarks: 30,
      durationMin: 12,
      totalQuestions: 50,
      negativeMarks: 0.50,
      topic: _topicText,
    ),
    TenseExam(
      title: 'Challenge Exam 2024',
      isChecked: false,
      totalMarks: 30,
      durationMin: 12,
      totalQuestions: 50,
      negativeMarks: 0.50,
      topic: _topicText,
    ),
  ];
}
