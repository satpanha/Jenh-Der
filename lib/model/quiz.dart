import 'package:jenh_der/model/quiz_question.dart';

class Quiz {
  final String id;
  final String placeId;
  final String title;
  final int pointReward;
  final int passScore;
  final List<QuizQuestion> questions;

  Quiz({
    required this.id,
    required this.placeId,
    required this.title,
    required this.pointReward,
    required this.passScore,
    required this.questions,
  });

  int scoreOf(List<int?> answers) {
    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      if (questions[i].isCorrect(answers[i])) {
        score++;
      }
    }

    return score;
  }

  bool isPassed(int score) {
    return score >= passScore;
  }
}
