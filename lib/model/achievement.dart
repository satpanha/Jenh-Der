import 'package:jenh_der/model/user.dart';

class Achievement {
  final String id;
  final String title;
  final String description;
  final int pointRequire;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.pointRequire,
  });

  bool isUnlockedBy(User user) {
    return user.totalPoint >= pointRequire;
  }
}
