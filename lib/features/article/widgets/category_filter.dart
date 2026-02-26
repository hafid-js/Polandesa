import 'package:flutter/material.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String activeCategory;
  final Function(String) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.activeCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isActive = category == activeCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () => onCategorySelected(category),
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive
                    ? HexColor.fromHex("#4158d0")
                    : Colors.white,
                foregroundColor: isActive ? Colors.white : Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                elevation: 0,
              ),
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
