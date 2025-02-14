


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/assets_app.dart';
import '../../../core/helper/custom_button_widget.dart';
import '../../../core/helper/custom_container_widget.dart';
import '../../../core/theme/colors_app.dart';
import '../../../providers/app_theme_provider.dart';
import 'onboarding_scroll_screen.dart';


class FristOnboardingScreen extends StatelessWidget {
  const FristOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   final themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDark();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsApp.logoEventOnboarding,
                height: size.height * 0.20,
                width: size.width * 0.5,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AssetsApp.fristImgOnboarding,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personalize Your Experience",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.secondColorLight,
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? ColorsApp.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.secondColorLight,
                    ),
                  ),
                  const Spacer(),
                  const CustomContainerWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.secondColorLight,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 70,
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
                            final themeProvider = Provider.of<AppThemeProvider>(
                                context,
                                listen: false);
                            themeProvider.changeTheme(ThemeMode.dark);
                          },
                          child: Image.asset(
                            AssetsApp.lightIcon,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 18),
                        GestureDetector(
                          onTap: () {
                            final themeProvider = Provider.of<AppThemeProvider>(
                                context,
                                listen: false);
                            themeProvider.changeTheme(ThemeMode.light);
                          },
                          child: Image.asset(
                            AssetsApp.darkIcon,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             CustomButtonWidget(
                buttonText: "Let's Start",
               onPressed: () {
            
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OnboardingScrollScreen()),
            );
          },
            ),
          ],
        ),
      ),
    );
  }
}
