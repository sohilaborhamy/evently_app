import 'package:evently_app/core/theme/colors_app.dart';

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onTab;
  final Color bgColor;
  final double borderRadius;
  final Color titleColor;

  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onTab,
    this.bgColor = ColorsApp.secondColorLight,
    this.titleColor = ColorsApp.white,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onTab,
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
