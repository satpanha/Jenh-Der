import 'package:flutter/material.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/service/learning_service.dart';
import 'package:jenh_der/ui/screens/article_screen.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';
import 'package:jenh_der/ui/widgets/category_chip.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  final LearningService service = LearningService();

  bool isBookmarked = false;

  void openLearning() {
    final article = service.getArticle(widget.place.id);
    final quiz = service.getQuiz(widget.place.id);

    if (article == null || quiz == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quiz for ${widget.place.name} is coming soon')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ArticleScreen(place: widget.place, article: article, quiz: quiz),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: AppColors.placeholder,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    CategoryChip(
                      label: place.category.label,
                      isSelected: false,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${place.province.name} Province, Cambodia',
                      style: const TextStyle(color: AppColors.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  place.description,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: AppColors.primary,
                  child: ListTile(
                    onTap: openLearning,
                    leading: const Icon(
                      Icons.school_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Learn & Quiz',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Test your knowledge',
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
