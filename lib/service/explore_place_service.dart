import 'package:jenh_der/model/category.dart';
import 'package:jenh_der/model/geo_point.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/model/province.dart';

final preahVihear = Province(id: 'PV', name: 'Preah Vihear');
final kampongThom = Province(id: 'KT', name: 'Kampong Thom');
final kampongSpeu = Province(id: 'KS', name: 'Kampong Speu');

final List<Place> _places = [
  Place(
    id: 'P001',
    name: 'Koh Ker',
    province: preahVihear,
    category: Category.temple,
    imageUrls: [
      'https://commons.wikimedia.org/wiki/Special:FilePath/0505280017PThompyramid.jpg?width=800',
      'https://commons.wikimedia.org/wiki/Special:FilePath/Koh_Ker_temple%282007%29.jpg?width=800',
    ],
    description:
        'A 10th-century temple complex and former capital of the Khmer Empire. '
        'Koh Ker is home to the impressive Prasat Thom, a seven-tiered pyramid '
        'that rises above the surrounding jungle. The site contains over 180 '
        'sanctuaries spread across a vast area, though only a few have been '
        'cleared from the forest. Visitors can climb to the top of the pyramid '
        'for panoramic views of the countryside. The remote location makes it '
        'a peaceful alternative to the more crowded temples of Angkor.',
    location: GeoPoint(latitude: 13.7847, longitude: 104.5375),
  ),
  Place(
    id: 'P002',
    name: 'Phnom Santuk',
    province: kampongThom,
    category: Category.temple,
    imageUrls: [],
    description:
        'A mountain temple and cultural site in Kampong Thom. Phnom Santuk is '
        'a sacred hill topped with Buddhist temples and a large reclining Buddha. '
        'Visitors climb a long staircase of over 800 steps to reach the summit, '
        'where they are rewarded with sweeping views of the surrounding plains and '
        'lakes. The site is an important pilgrimage destination for Cambodian '
        'Buddhists and features several caves and shrines along the path.',
    location: GeoPoint(latitude: 12.2500, longitude: 104.9500),
  ),
  Place(
    id: 'P003',
    name: 'Sambor Prei Kuk',
    province: kampongThom,
    category: Category.temple,
    imageUrls: [],
    description:
        'An ancient temple complex and UNESCO World Heritage Site. Sambor Prei Kuk '
        'was the capital of the Chenla Empire in the 7th century, predating Angkor '
        'by several hundred years. The site features over 100 temples in various '
        'states of preservation, many built from brick with intricate carvings. '
        'The temples are set among trees and rice fields, creating a serene and '
        'atmospheric experience for visitors exploring this important archaeological site.',
    location: GeoPoint(latitude: 12.8800, longitude: 104.9800),
  ),
  Place(
    id: 'P004',
    name: 'Kirirom',
    province: kampongSpeu,
    category: Category.nature,
    imageUrls: [],
    description:
        'A scenic national park known for its pine forest and nature. Kirirom '
        'National Park sits at an elevation of about 675 meters, offering cool '
        'temperatures and a refreshing escape from the heat of the lowlands. '
        'The park features pine-covered hills, waterfalls, and walking trails '
        'through the forest. Visitors can camp, stay in bungalows, or enjoy '
        'picnics by the lake. It is a popular weekend destination for both locals '
        'and tourists seeking relaxation in nature.',
    location: GeoPoint(latitude: 11.3100, longitude: 104.0700),
  ),
];

class ExplorePlaceService {
  List<Place> getPlaces() {
    return _places;
  }

  List<Place> filterPlaces(Category category, String keyword) {
    final result = <Place>[];

    for (final place in _places) {
      final sameCategory = category == Category.all || place.category == category;

      if (sameCategory && place.matchesSearch(keyword)) {
        result.add(place);
      }
    }

    return result;
  }
}
