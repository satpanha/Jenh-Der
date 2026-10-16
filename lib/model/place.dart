import 'package:jenh_der/model/category.dart';
import 'package:jenh_der/model/geo_point.dart';
import 'package:jenh_der/model/province.dart';

class Place {
  final String id;
  final String name;
  final Province province;
  final Category category;
  final List<String> imageUrls;
  final String description;
  final GeoPoint location;

  Place({
    required this.id,
    required this.name,
    required this.province,
    required this.category,
    required this.imageUrls,
    required this.description,
    required this.location,
  });

  bool matchesSearch(String keyword) {
    final text = keyword.trim().toLowerCase();

    if (text.isEmpty) {
      return true;
    }

    return name.toLowerCase().contains(text) ||
        province.name.toLowerCase().contains(text);
  }
}
