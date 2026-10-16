class QuizQuestion {
  final String text;
  final String imageUrl;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.text,
    required this.imageUrl,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  bool isCorrect(int? picked) {
    return picked == correctIndex;
  }
}
