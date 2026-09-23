import 'package:jenh_der/model/article_section.dart';

class Article {
  final String id;
  final String placeId;
  final String title;
  final int readMinute;
  final String didYouKnow;
  final List<ArticleSection> sections;

  Article({
    required this.id,
    required this.placeId,
    required this.title,
    required this.readMinute,
    required this.didYouKnow,
    required this.sections,
  });
}
