import 'package:jenh_der/model/user_role.dart';

class User {
  final String id;
  final String name;
  final UserRole role;
  int totalPoint;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.totalPoint,
  });

  void addPoint(int points) {
    if (points < 0) {
      return;
    }

    totalPoint += points;
  }
}
