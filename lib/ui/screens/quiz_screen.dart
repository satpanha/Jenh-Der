import 'package:flutter/material.dart';
import 'package:jenh_der/model/quiz.dart';
import 'package:jenh_der/ui/screens/quiz_result_screen.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';
import 'package:jenh_der/ui/widgets/app_image.dart';
import 'package:jenh_der/ui/widgets/main_button.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  late List<int?> answers = List<int?>.filled(widget.quiz.questions.length, null);

  void pickOption(int index) {
    if (answers[currentIndex] != null) {
      return;
    }

    setState(() {
      answers[currentIndex] = index;
    });
  }

  void goNext() {
    final isLast = currentIndex == widget.quiz.questions.length - 1;

    if (isLast) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuizResultScreen(quiz: widget.quiz, answers: answers),
        ),
      );
      return;
    }

    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.quiz.questions;
    final question = questions[currentIndex];
    final picked = answers[currentIndex];
    final isLast = currentIndex == questions.length - 1;

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.primaryDark),
                  ),
                  Text(
                    'Question ${currentIndex + 1} of ${questions.length}',
                    style: const TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    AppImage(path: question.imageUrl, height: 200),
                    const SizedBox(height: 16),
                    Text(
                      question.text,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    for (int i = 0; i < question.options.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          onTap: () => pickOption(i),
                          tileColor: picked == i
                              ? (question.isCorrect(i)
                                    ? AppColors.primaryDark
                                    : AppColors.wrong)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: const BorderSide(color: AppColors.line),
                          ),
                          leading: Text(
                            String.fromCharCode(65 + i),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: picked == i ? Colors.white : AppColors.primary,
                            ),
                          ),
                          title: Text(
                            question.options[i],
                            style: TextStyle(
                              color: picked == i ? Colors.white : AppColors.textDark,
                            ),
                          ),
                        ),
                      ),
                    if (picked != null)
                      Text(
                        question.isCorrect(picked)
                            ? 'Nice! ${question.explanation}'
                            : 'Not quite. ${question.explanation}',
                        style: const TextStyle(color: AppColors.textMuted),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              MainButton(
                label: isLast ? 'See Result' : 'Next Question',
                onPressed: picked == null ? null : goNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
