class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.options,
    required this.currentLevel,
    required this.totalLevel,
  });

  final String question;
  final Map<String, String> options;
  final int currentLevel;
  final int totalLevel;

  static const QuizQuestion sample = QuizQuestion(
    question: 'Which sentence is in future tense?',
    options: {
      'A': 'I play cricket.',
      'B': 'I played cricket',
      'C': 'I will play cricket',
      'D': 'I am playing cricket',
      'E': 'Not Sure',
    },
    currentLevel: 4,
    totalLevel: 7,
  );
}
