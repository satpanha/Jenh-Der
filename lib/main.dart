import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jenh_der/model/category.dart';
import 'package:jenh_der/model/geo_point.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/model/province.dart';
import 'package:jenh_der/service/explore_place_service.dart';
import 'package:jenh_der/ui/screens/map_screen.dart';
import 'package:jenh_der/ui/screens/place_detail_screen.dart';

final preahVihear = Province(id: 'PV', name: 'Preah Vihear');
final kampongThom = Province(id: 'KT', name: 'Kampong Thom');
final kampongSpeu = Province(id: 'KS', name: 'Kampong Speu');

final places = <Place>[
  Place(
    id: 'P001',
    name: 'Koh Ker',
    province: preahVihear,
    category: Category.temple,
    imageUrls: [],
    description:
        'A 10th-century temple complex and former capital of the Khmer Empire.',
    location: GeoPoint(latitude: 13.7847, longitude: 104.5375),
  ),
  Place(
    id: 'P002',
    name: 'Phnom Santuk',
    province: kampongThom,
    category: Category.temple,
    imageUrls: [],
    description: 'A mountain temple and cultural site in Kampong Thom.',
    location: GeoPoint(latitude: 12.2500, longitude: 104.9500),
  ),
  Place(
    id: 'P003',
    name: 'Sambor Prei Kuk',
    province: kampongThom,
    category: Category.temple,
    imageUrls: [],
    description: 'An ancient temple complex and UNESCO World Heritage Site.',
    location: GeoPoint(latitude: 12.8800, longitude: 104.9800),
  ),
  Place(
    id: 'P004',
    name: 'Kirirom',
    province: kampongSpeu,
    category: Category.nature,
    imageUrls: [],
    description: 'A scenic national park known for its pine forest and nature.',
    location: GeoPoint(latitude: 11.3100, longitude: 104.0700),
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final explorePlaceService = ExplorePlaceService();
  final displayedPlaces = explorePlaceService.getPlaces(places);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      // home: MapScreen(places: displayedPlaces),
      home: PlaceDetailScreen(place: places[2]),
    );
  }
}
