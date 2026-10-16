import 'package:jenh_der/model/article.dart';
import 'package:jenh_der/model/article_section.dart';
import 'package:jenh_der/model/quiz.dart';
import 'package:jenh_der/model/quiz_question.dart';

const String _kohKerPhoto =
    'https://commons.wikimedia.org/wiki/Special:FilePath/0505280017PThompyramid.jpg?width=800';
const String _kohKerTemple =
    'https://commons.wikimedia.org/wiki/Special:FilePath/Koh_Ker_temple%282007%29.jpg?width=800';

final List<Article> _articles = [
  Article(
    id: 'A001',
    placeId: 'P001',
    title: 'Koh Ker: The Lost Pyramid Capital',
    readMinute: 3,
    didYouKnow:
        "Unlike most Khmer temples, which spread out on a single level, "
        "Koh Ker's main temple Prasat Thom is a true step-pyramid. Its shape "
        "reminds many visitors of the Mayan pyramids of Mesoamerica, "
        "thousands of miles away.",
    sections: [
      ArticleSection(
        heading: null,
        body:
            'Hidden deep within the dense northern forests of Cambodia lies the '
            'enigmatic archaeological site of Koh Ker. For centuries, this grand '
            'metropolis sat swallowed by roots and vines. Only in recent decades '
            'has the thick canopy parted to reveal its monumental secrets.',
      ),
      ArticleSection(
        heading: 'The Sandstone Pyramid',
        body:
            'Under King Jayavarman IV, the capital of the Khmer Empire was moved '
            'from Angkor to this remote sanctuary in 928 AD. Prasat Thom was '
            'built as the central state temple. Rising about 36 meters high, its '
            'seven tiers of sandstone blocks dominate the surrounding jungle '
            'skyline.',
        imageUrl: _kohKerTemple,
      ),
      ArticleSection(
        heading: null,
        body:
            'Koh Ker is also famous for some of the most dynamic, large-scale, '
            'free-standing sculptures of the Angkorian era. Many of these '
            'masterpieces now sit in museums around the world, showing a short '
            'golden peak of Khmer art.',
      ),
    ],
  ),
];

final List<Quiz> _quizzes = [
  Quiz(
    id: 'Q001',
    placeId: 'P001',
    title: 'Koh Ker Quiz',
    pointReward: 50,
    passScore: 3,
    questions: [
      QuizQuestion(
        text: 'Which king moved the Khmer capital to Koh Ker?',
        imageUrl: _kohKerPhoto,
        options: [
          'Jayavarman VII',
          'Suryavarman II',
          'Jayavarman IV',
          'Indravarman I',
        ],
        correctIndex: 2,
        explanation: 'Jayavarman IV moved the royal court to Koh Ker in 928 AD.',
      ),
      QuizQuestion(
        text: 'What made Koh Ker unique among Khmer capitals?',
        imageUrl: _kohKerPhoto,
        options: [
          'It was the largest city in Southeast Asia',
          'It briefly replaced Angkor as the capital',
          'It was built entirely of sandstone',
          'It was a major coastal trading port',
        ],
        correctIndex: 1,
        explanation: 'Koh Ker briefly replaced Angkor as capital in 928 AD.',
      ),
      QuizQuestion(
        text: 'How many tiers does the Prasat Thom pyramid have?',
        imageUrl: _kohKerPhoto,
        options: ['Three', 'Five', 'Seven', 'Nine'],
        correctIndex: 2,
        explanation: 'Prasat Thom rises in seven massive sandstone tiers.',
      ),
      QuizQuestion(
        text: 'In which province is Koh Ker located?',
        imageUrl: _kohKerPhoto,
        options: ['Siem Reap', 'Preah Vihear', 'Kampong Thom', 'Battambang'],
        correctIndex: 1,
        explanation: 'Koh Ker sits in the remote north of Preah Vihear province.',
      ),
      QuizQuestion(
        text: 'Koh Ker is famous for what kind of art?',
        imageUrl: _kohKerPhoto,
        options: [
          'Large free-standing sculptures',
          'Silk weaving',
          'Cave paintings',
          'Bronze drums',
        ],
        correctIndex: 0,
        explanation:
            'Its large, dynamic sculptures are some of the finest of the Angkorian era.',
      ),
    ],
  ),
];

class LearningService {
  Article? getArticle(String placeId) {
    for (final article in _articles) {
      if (article.placeId == placeId) {
        return article;
      }
    }
    return null;
  }

  Quiz? getQuiz(String placeId) {
    for (final quiz in _quizzes) {
      if (quiz.placeId == placeId) {
        return quiz;
      }
    }
    return null;
  }
}
