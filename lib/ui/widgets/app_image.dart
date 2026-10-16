import 'package:flutter/material.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double height;

  const AppImage({super.key, required this.path, this.height = 180});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.placeholder,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Center(child: Icon(Icons.image_outlined, color: Colors.white)),
          if (path.isNotEmpty)
            Image.network(
              path,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }
}
