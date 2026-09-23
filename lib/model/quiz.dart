import 'package:jenh_der/model/quiz_qestion.dart';

class Quiz {
  final String id;
  final String placeId;
  final String title;
  final int pointReward;
  final int passScore;
  final List<QuizQestion> question;

  Quiz({
    required this.id,
    required this.placeId,
    required this.title,
    required this.pointReward,
    required this.passScore,
    required this.question,
  });

  int scoreOf(List<int?> answers) {
    var score = 0;

    for (var i = 0; i < question.length; i++) {
      final picked = i < answers.length ? answers[i] : null;

      if (question[i].isCorrect(picked)) {
        score++;
      }
    }

    return score;
  }

  bool isPassed(int score) {
    return score >= passScore;
  }
}
