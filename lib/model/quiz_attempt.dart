class QuizAttempt {
  final String id;
  final String userId;
  final String quizId;
  final List<int?> answers;
  final int score;
  final DateTime completedAt;

  QuizAttempt({
    required this.id,
    required this.userId,
    required this.quizId,
    required this.answers,
    required this.score,
    required this.completedAt,
  });

  double percentage() {
    if (answers.isEmpty) {
      return 0.0;
    }

    return (score / answers.length) * 100;
  }
}
