import 'dart:core';
import 'dart:developer';


import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:provider/provider.dart';
import '../../core/constants/assets_app.dart';
import '../../core/theme/colors_app.dart';
import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> _languageList = [
      AppLocalizations.of(context)!.arabic,
      AppLocalizations.of(context)!.english,
    ];
    List<String> _themeList = [
      AppLocalizations.of(context)!.dark,
      AppLocalizations.of(context)!.light,
    ];
   

    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDark();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.28,
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 68, left: 20, right: 20, bottom: 20),
            decoration: const  BoxDecoration(
              color: ColorsApp.secondColorLight,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(64.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1000),
                        bottomRight: Radius.circular(1000),
                        topRight: Radius.circular(1000),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Image.asset(AssetsApp.routeLogo),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Safwat",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xffF2FEFF),
                        ),
                      ),
                      Text(
                        "johnsafwat.route@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xffF2FEFF),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style:  TextStyle(
                    fontWeight: FontWeight.w700,
                    color:  isDarkMode ? ColorsApp.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: height * 0.02),
                CustomDropdown<String>(
                  hintText: languageProvider.appLanguage == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  items: _languageList,
                  onChanged: (value) {
                    if (value == AppLocalizations.of(context)!.english) {
                      languageProvider.changeLanguage("en");
                    } else if (value == AppLocalizations.of(context)!.arabic) {
                      languageProvider.changeLanguage("ar");
                    }
                  },
                  decoration: CustomDropdownDecoration(
                      closedBorder: Border.all(
                          color: ColorsApp.secondColorLight, width: 2),
                            listItemStyle: const TextStyle(
                            color : ColorsApp.secondColorLight
                          ),
                          closedFillColor: ColorsApp.primaryColorLight,
                      headerStyle:const  TextStyle(
                        color: ColorsApp.secondColorLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      closedBorderRadius: BorderRadius.circular(18),
                      closedSuffixIcon: const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 28,
                        color: ColorsApp.secondColorLight,
                      )),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style:  TextStyle(
                    fontWeight: FontWeight.w700,
                    color:  isDarkMode ? ColorsApp.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: height * 0.02),
                CustomDropdown<String>(
                  hintText: themeProvider.isDark() == "dark" ?  AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  items: _themeList,
                  onChanged: (value) {
                    if (value == "Dark") {
                      themeProvider.changeTheme(ThemeMode.dark);
                    } else if (value == "Light") {
                      themeProvider.changeTheme(ThemeMode.light);
                    }
                  },
                  decoration: CustomDropdownDecoration(
                    
                      closedBorder: Border.all(
                          color: ColorsApp.secondColorLight, width: 2),
                          listItemStyle: const TextStyle(
                            color : ColorsApp.secondColorLight
                          ),
                          
                      headerStyle: const TextStyle(
                        color: ColorsApp.secondColorLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      closedBorderRadius: BorderRadius.circular(18),
                      closedSuffixIcon: const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 28,
                        color: ColorsApp.secondColorLight,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
