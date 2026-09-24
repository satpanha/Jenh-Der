import 'package:jenh_der/model/place.dart';

class ExplorePlaceService  {
  List<Place> getPlaces(List<Place> allPlaces) {
    return allPlaces;
  }

  List<Place> searchPlcae(List<Place> allPlaces, String keyword) {
    return allPlaces.where((p) => p.matchesSearch(keyword)).toList();
  }
}
