import 'package:evently_app/core/theme/colors_app.dart';
import 'package:flutter/material.dart';

import '../../../models/event_category.dart';



class TabWidget extends StatelessWidget {
  final EventCategory eventCategory;
  final bool isSelected;

  const TabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? ColorsApp.secondColorLight : ColorsApp.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: ColorsApp.secondColorLight),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color: isSelected ? ColorsApp.white : ColorsApp.secondColorLight,
          ),
          SizedBox(width: 5),
          Text(
            eventCategory.eventCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? ColorsApp.white
                    : ColorsApp.secondColorLight),
          )
        ],
      ),
    );
  }
}
