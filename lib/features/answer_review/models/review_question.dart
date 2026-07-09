/// Status of a single answer-review option row.
enum ReviewOptionStatus { neutral, correct, wrongSelected }

class ReviewOption {
  const ReviewOption(this.letter, this.text, this.status);

  final String letter;
  final String text;
  final ReviewOptionStatus status;
}

/// One reviewed question with its options and static sample data set,
/// matching assets/Right and wrong answer.png.
class ReviewQuestion {
  const ReviewQuestion({
    required this.number,
    required this.text,
    required this.options,
    required this.isFavorite,
  });

  final int number;
  final String text;
  final List<ReviewOption> options;
  final bool isFavorite;

  static const List<ReviewQuestion> sample = [
    ReviewQuestion(
      number: 1,
      text: 'Which is the largest river in Bangladesh?',
      isFavorite: true,
      options: [
        ReviewOption('A', 'Teesta', ReviewOptionStatus.wrongSelected),
        ReviewOption('B', 'Padma', ReviewOptionStatus.neutral),
        ReviewOption('C', 'Jamuna', ReviewOptionStatus.neutral),
        ReviewOption('D', 'Meghna', ReviewOptionStatus.correct),
      ],
    ),
    ReviewQuestion(
      number: 2,
      text: 'Who is known as the "Father of the Nation" of Bangladesh?',
      isFavorite: false,
      options: [
        ReviewOption('A', 'Ziaur Rahman', ReviewOptionStatus.wrongSelected),
        ReviewOption('B', 'Sheikh Mujibur Rahman', ReviewOptionStatus.correct),
        ReviewOption('C', 'A. K. Fazlul Huq', ReviewOptionStatus.neutral),
        ReviewOption('D', 'Huseyn Shaheed Suhrawardy', ReviewOptionStatus.neutral),
      ],
    ),
    ReviewQuestion(
      number: 3,
      text: 'Which gas is most abundant in the Earth\'s atmosphere?',
      isFavorite: false,
      options: [
        ReviewOption('A', 'Oxygen', ReviewOptionStatus.neutral),
        ReviewOption('B', 'Carbon dioxide', ReviewOptionStatus.wrongSelected),
        ReviewOption('C', 'Nitrogen', ReviewOptionStatus.neutral),
        ReviewOption('D', 'Hydrogen', ReviewOptionStatus.neutral),
      ],
    ),
  ];
}
