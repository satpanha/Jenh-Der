import 'package:flutter/material.dart';
import 'package:jenh_der/model/article.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/model/quiz.dart';
import 'package:jenh_der/ui/screens/quiz_screen.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';
import 'package:jenh_der/ui/widgets/app_image.dart';
import 'package:jenh_der/ui/widgets/main_button.dart';

class ArticleScreen extends StatefulWidget {
  final Place place;
  final Article article;
  final Quiz quiz;

  const ArticleScreen({
    super.key,
    required this.place,
    required this.article,
    required this.quiz,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isBookmarked = false;

  void openQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen(quiz: widget.quiz)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;
    final images = widget.place.imageUrls;

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
                  ),
                  const Text(
                    'JENH DER',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  AppImage(path: images.isNotEmpty ? images.first : ''),
                  const SizedBox(height: 20),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${article.readMinute} min read · ${widget.quiz.questions.length} question quiz',
                    style: const TextStyle(color: AppColors.primary),
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < article.sections.length; i++) ...[
                    if (article.sections[i].heading != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          article.sections[i].heading!,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    Text(
                      article.sections[i].body,
                      style: const TextStyle(
                        height: 1.6,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    if (article.sections[i].imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AppImage(path: article.sections[i].imageUrl!),
                      ),
                    const SizedBox(height: 20),
                    if (i == 0)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.callout,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'DID YOU KNOW?',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              article.didYouKnow,
                              style: const TextStyle(
                                height: 1.5,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MainButton(label: 'Take the Quiz', onPressed: openQuiz),
            ),
          ],
        ),
      ),
    );
  }
}
