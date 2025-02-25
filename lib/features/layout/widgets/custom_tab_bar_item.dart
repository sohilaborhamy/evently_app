
import 'package:evently_app/core/extensions/dimensions_ext.dart';
import 'package:evently_app/core/theme/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const CustomTabBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsApp.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorsApp.white,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? ColorsApp.secondColorLight : ColorsApp.white,
          ),
          4.spaceHorizontal,
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:
                  isSelected ? ColorsApp.secondColorLight : ColorsApp.white,
            ),
          ),
        ],
      ),
    );
  }
}
