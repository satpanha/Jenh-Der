import 'package:flutter/material.dart';
import 'package:jenh_der/ui/theme/app_colors.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const MainButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey.shade400,
        disabledForegroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: const StadiumBorder(),
      ),
      child: Text(label),
    );
  }
}
