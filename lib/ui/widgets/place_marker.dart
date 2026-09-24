import 'package:flutter/material.dart';
import 'package:jenh_der/model/place.dart';

class PlaceMarker extends StatelessWidget {
  final Place place;

  const PlaceMarker({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(place.name, textAlign: TextAlign.center),
      ],
    );
  }
}
