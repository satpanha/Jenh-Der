import 'package:flutter/material.dart';
import 'package:jenh_der/model/category.dart';
import 'package:jenh_der/model/geo_point.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/service/explore_place_service.dart';
import 'package:jenh_der/ui/screens/place_detail_screen.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';
import 'package:jenh_der/ui/widgets/category_chip.dart';
import 'package:jenh_der/ui/widgets/place_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ExplorePlaceService service = ExplorePlaceService();

  Category selectedCategory = Category.all;
  String searchText = '';

  Offset getMarkerPosition(GeoPoint point, List<Place> allPlaces, Size size) {
    double minLat = allPlaces.first.location.latitude;
    double maxLat = minLat;
    double minLng = allPlaces.first.location.longitude;
    double maxLng = minLng;

    for (final place in allPlaces) {
      final lat = place.location.latitude;
      final lng = place.location.longitude;

      if (lat < minLat) minLat = lat;
      if (lat > maxLat) maxLat = lat;
      if (lng < minLng) minLng = lng;
      if (lng > maxLng) maxLng = lng;
    }

    double latRange = maxLat - minLat;
    double lngRange = maxLng - minLng;

    if (latRange == 0) latRange = 1;
    if (lngRange == 0) lngRange = 1;

    final x = (point.longitude - minLng) / lngRange;
    final y = 1 - (point.latitude - minLat) / latRange;

    const padding = 60.0;
    final width = size.width - padding * 2;
    final height = size.height - padding * 2 - 200;

    return Offset(padding + x * width, padding + 150 + y * height);
  }

  void openDetail(Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaceDetailScreen(place: place)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allPlaces = service.getPlaces();
    final visiblePlaces = service.filterPlaces(selectedCategory, searchText);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mapBackground,
      body: Stack(
        children: [
          for (final place in visiblePlaces)
            Positioned(
              left: getMarkerPosition(place.location, allPlaces, size).dx,
              top: getMarkerPosition(place.location, allPlaces, size).dy,
              child: PlaceMarker(place: place, onTap: () => openDetail(place)),
            ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 46,
                            height: 46,
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'JENH DER',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                'Explore-Play',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.menu, size: 30, color: AppColors.primaryDark),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        searchText = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search places, provinces...',
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.glass,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: AppColors.glassBorder),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 8, // horizontal gap
                    runSpacing: 8, // vertical gap between lines
                    children: [
                      for (final category in Category.values)
                        CategoryChip(
                          label: category.label,
                          isSelected: category == selectedCategory,
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                    ],
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
