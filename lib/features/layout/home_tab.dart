import 'package:evently_app/core/extensions/extensions.dart';
import 'package:evently_app/features/layout/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/helper/custom_elevated_button.dart';
import '../../core/theme/colors_app.dart';
import 'widgets/custom_tab_bar_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
   
       return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const  BoxDecoration(
              color: ColorsApp.secondColorLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            width: 1.width,
            height: 0.27.height,
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Column(
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorsApp.white,
                            ),
                          ),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 24,
                              color: ColorsApp.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/icons/Sun.svg"),
                      8.spaceHorizontal,
                      CustomElevatedButton(
                        title: 'EN',
                        onTab: () {},
                        borderRadius: 8,
                        titleColor: ColorsApp.secondColorLight,
                        bgColor: ColorsApp.white,
                      ),
                    ],
                  ),
                  16.spaceVertical,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: ColorsApp.white,
                      ),
                      4.spaceHorizontal,
                      const Text(
                        "Cairo , Egypt",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsApp.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  8.spaceVertical,
                  Expanded(
                    child: TabBar(
                      onTap: (value) {},
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: const [
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: true,
                        ),
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: false,
                        ),
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: false,
                        ),
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: false,
                        ),
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: false,
                        ),
                        CustomTabBarItem(
                          title: 'Sports',
                          icon: Icons.sports,
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.spaceVertical,
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return const CategoryCard();
              },
              separatorBuilder: (context, index) {
                return 16.spaceVertical;
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    
      
    );

  }
}