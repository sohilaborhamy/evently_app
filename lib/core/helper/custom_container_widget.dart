
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../constants/assets_app.dart';
import '../theme/colors_app.dart';







class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({super.key});

  
  @override
  Widget build(BuildContext context) {
   
     var width = MediaQuery.of(context).size.width; 
    return Container(
     width: width*0.2,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.secondColorLight,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              final languageProvider =
                  Provider.of<AppLanguageProvider>(context, listen: false);
              languageProvider.changeLanguage("en");
            },
            child: Image.asset(
              AssetsApp.lrIcon,
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 18),
          GestureDetector(
            onTap: () {
              final languageProvider =
                  Provider.of<AppLanguageProvider>(context, listen: false);
              languageProvider.changeLanguage("ar");
            },
            child: Image.asset(
              AssetsApp.egIcon,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}