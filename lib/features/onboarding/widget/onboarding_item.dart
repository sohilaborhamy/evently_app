
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../../core/theme/colors_app.dart';
import '../../../providers/app_theme_provider.dart';
import '../models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
 final OnboardingModel onboardingModel;
  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
       final themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDark();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            onboardingModel.image,
            height: size.height * 0.35,
          ),
          Text(
            onboardingModel.header,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorsApp.secondColorLight,
            ),
          ),
          Text(
            onboardingModel.description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? ColorsApp.white : Colors.black,
            ),
          ),
        ]);
  }
}
