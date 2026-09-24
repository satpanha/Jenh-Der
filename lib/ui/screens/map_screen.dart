import 'package:flutter/material.dart';
import 'package:jenh_der/model/category.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/ui/widgets/category_chip.dart';
import 'package:jenh_der/ui/widgets/place_marker.dart';

class MapScreen extends StatelessWidget {
  final List<Place> places;
 

  const MapScreen({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MapHeader(),
          const SearchBar(),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CategoryChip(label: Category.all.name, isSelected: true),
                const SizedBox(width: 8),
                CategoryChip(label: Category.temple.name, isSelected: false),
                const SizedBox(width: 8),
                CategoryChip(label: Category.lake.name, isSelected: false),
                const SizedBox(width: 8),
                CategoryChip(label: Category.nature.name, isSelected: false),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            height: 160,
            color: Colors.green.shade50,
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: places
                  .map(
                    (place) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: PlaceMarker(place: place),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MapHeader extends StatelessWidget {
  const MapHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenh Der',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:  Colors.black87),
                  ),
                  Text(
                    'Explore-Play',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: ColoredBox(color: Colors.grey),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Search places, provinces...',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
