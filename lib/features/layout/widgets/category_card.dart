import 'package:evently_app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors_app.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 0.9.width,
      height: 0.25.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/category/meeting.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsApp.lightCyan,
            ),
            child: const Text(
              "21\nNOV",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsApp.secondColorLight,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorsApp.white,
            ),
            child:  Row(
              children: [
                const Expanded(
                  child: Text(
                    "Meeting for Updating The Development Method ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorsApp.black,
                    ),
                  ),
                ),
                8.spaceHorizontal,
                const Icon(
                  Icons.favorite,
                  color: ColorsApp.secondColorLight,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

