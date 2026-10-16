import 'package:flutter/material.dart';
import 'package:jenh_der/model/quiz.dart';
import 'package:jenh_der/ui/screens/quiz_screen.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';
import 'package:jenh_der/ui/widgets/main_button.dart';

class QuizResultScreen extends StatelessWidget {
  final Quiz quiz;
  final List<int?> answers;

  const QuizResultScreen({super.key, required this.quiz, required this.answers});

  @override
  Widget build(BuildContext context) {
    final total = quiz.questions.length;
    final score = quiz.scoreOf(answers);
    final passed = quiz.isPassed(score);
    final percent = (score * 100 / total).round();

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Icon(
                passed ? Icons.emoji_events_outlined : Icons.menu_book_outlined,
                size: 60,
                color: AppColors.primaryDark,
              ),
              const SizedBox(height: 16),
              Text(
                passed ? 'Great job!' : 'Keep exploring!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$score / $total correct · $percent%',
                style: const TextStyle(color: AppColors.primary),
              ),
              const SizedBox(height: 4),
              Text(
                passed
                    ? '+${quiz.pointReward} points earned'
                    : 'You need ${quiz.passScore} correct answers to pass',
                style: const TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: total,
                  itemBuilder: (context, i) {
                    final question = quiz.questions[i];
                    final isCorrect = question.isCorrect(answers[i]);

                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('${i + 1}. ${question.text}'),
                        trailing: Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect ? AppColors.primary : AppColors.wrong,
                        ),
                      ),
                    );
                  },
                ),
              ),
              MainButton(
                label: 'Try Again',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(quiz: quiz),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Back to Map'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
