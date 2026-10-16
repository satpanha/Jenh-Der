import 'package:flutter/material.dart';
import 'package:jenh_der/model/place.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';

class PlaceMarker extends StatelessWidget {
  final Place place;
  final VoidCallback onTap;

  const PlaceMarker({super.key, required this.place, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 27,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.place, color: Colors.white),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.primary),
            Text(
              place.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
