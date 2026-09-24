import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey,
        ),
      ),

      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
