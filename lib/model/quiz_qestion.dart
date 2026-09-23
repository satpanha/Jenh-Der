import 'package:jenh_der/model/answer_status.dart';

class QuizQestion {
  final String text;
  final String imageUrls;
  final List<String> options;
  final int correctIndex;
  final String explaination;

  QuizQestion({
    required this.text,
    required this.imageUrls,
    required this.options,
    required this.correctIndex,
    required this.explaination,
  });

  bool isCorrect(int? picked) {
    return picked != null && picked == correctIndex;
  }

  AnswerStatus statusOff(int i, int? picked) {
    if (picked == null) {
      return AnswerStatus.neutral;
    }

    if (i == picked && isCorrect(picked)) {
      return AnswerStatus.correct;
    }

    if (i == picked && !isCorrect(picked)) {
      return AnswerStatus.wrong;
    }

    return AnswerStatus.neutral;
  }
}
